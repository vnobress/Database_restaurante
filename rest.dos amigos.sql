-- Criação das tabelas

CREATE TABLE "estoque" (
	"id_item" INTEGER NOT NULL UNIQUE,
	"id_fornecedor" INTEGER NOT NULL,
	"preco_unitario" VARCHAR(255),
	"nome_item" VARCHAR(255),
	"categoria" VARCHAR(255),
	"quantidade" NUMERIC,
	PRIMARY KEY("id_item")
);

CREATE TABLE "compras" (
	"id_compra" INTEGER NOT NULL UNIQUE,
	"id_item" INTEGER NOT NULL,
	"id_fornecedor" INTEGER NOT NULL,
	"data_compra" DATE,
	"valor_total" VARCHAR(255),
	"status_compras" VARCHAR(255),
	PRIMARY KEY("id_compra")
);

CREATE TABLE "fornecedores" (
	"id_fornecedor" INTEGER NOT NULL UNIQUE,
	"nome_fornecedor" VARCHAR(255),
	"contato" VARCHAR(255),
	"cidade" VARCHAR(255),
	PRIMARY KEY("id_fornecedor")
);

CREATE TABLE "feedback" (
	"id_feedback" INTEGER NOT NULL UNIQUE,
	"id_cliente" INTEGER NOT NULL,
	"comentario" VARCHAR(255),
	"nota" NUMERIC,
	"data_feedback" DATE,
	PRIMARY KEY("id_feedback")
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL UNIQUE,
	"nome_cliente" VARCHAR(255),
	"email" VARCHAR(255),
	"telefone" VARCHAR(255),
	"data_registro" DATE,
	PRIMARY KEY("id_cliente")
);

CREATE TABLE "funcionarios" (
	"id_funcionario" INTEGER NOT NULL UNIQUE,
	"nome_funcionario" VARCHAR(255),
	"cargo" VARCHAR(255),
	"horario_trabalho" VARCHAR(255),
	"salario" VARCHAR(255),
	"data_admissao" DATE,
	PRIMARY KEY("id_funcionario")
);

-- Inserindo dados na tabela "fornecedores"
INSERT INTO fornecedores (id_fornecedor, nome_fornecedor, contato, cidade) VALUES
(1, 'Distribuidora Alimentos S/A', 'alimentos@distribuidora.com', 'São Paulo'),
(2, 'Bebidas Brasil', 'contato@bebidasbr.com', 'Rio de Janeiro'),
(3, 'Hortifruti Natural', 'vendas@hortifrutis.com', 'Belo Horizonte');

-- Inserindo dados na tabela "estoque"
INSERT INTO estoque (id_item, id_fornecedor, preco_unitario, nome_item, categoria, quantidade) VALUES
(1, 1, '45.00/kg', 'Filé de Salmão', 'Proteínas', 20),
(2, 1, '4.00/kg', 'Arroz Branco', 'Grãos', 50),
(3, 3, '5.50/unidade', 'Alface Americana', 'Hortifruti', 30),
(4, 2, '60.00/garrafa', 'Vinho Tinto (Cabernet Sauvignon)', 'Bebidas', 25),
(5, 1, '20.00/500 ml', 'Azeite de Oliva Extra Virgem', 'Condimentos', 15),
(6, 3, '3.00/kg', 'Batata Inglesa', 'Hortifruti', 100),
(7, 1, '18.00/kg', 'Peito de Frango', 'Proteínas', 40),
(8, 2, '12.00/garrafa', 'Cerveja Artesanal', 'Bebidas', 50),
(9, 1, '7.00/1 kg', 'Molho de Tomate', 'Condimentos', 30),
(10, 1, '6.00/500 g', 'Macarrão Tipo Spaghetti', 'Grãos', 80);

-- Inserindo dados na tabela "clientes"
INSERT INTO clientes (id_cliente, nome_cliente, email, telefone, data_registro) VALUES
(1, 'João Pereira', 'joao.pereira@email.com', '11999998888', '2022-01-10'),
(2, 'Maria Souza', 'maria.souza@email.com', '21988887777', '2023-03-15'),
(3, 'Carlos Lima', 'carlos.lima@email.com', '31977776666', '2021-05-22');

-- Inserindo dados na tabela "compras"
INSERT INTO compras (id_compra, id_item, id_fornecedor, data_compra, valor_total, status_compras) VALUES
(1, 1, 1, '2023-02-10', '900.00', 'Entregue'),
(2, 4, 2, '2023-03-12', '1500.00', 'Pendente'),
(3, 7, 1, '2023-04-18', '720.00', 'Entregue'),
(4, 8, 2, '2023-05-10', '600.00', 'Cancelada');

-- Inserindo dados na tabela "feedback"
INSERT INTO feedback (id_feedback, id_cliente, comentario, nota, data_feedback) VALUES
(1, 1, 'Ótimo atendimento!', 5, '2023-03-01'),
(2, 2, 'Boa qualidade dos produtos.', 4, '2023-04-01'),
(3, 3, 'Entrega rápida, recomendo.', 5, '2023-05-05');

-- Inserindo dados na tabela "funcionarios"
INSERT INTO funcionarios (id_funcionario, nome_funcionario, cargo, horario_trabalho, salario, data_admissao) VALUES
(1, 'Ana Fernandes', 'Gerente', '09:00 - 18:00', '5000.00', '2021-06-01'),
(2, 'Paulo Ramos', 'Atendente', '08:00 - 17:00', '2500.00', '2022-02-15'),
(3, 'Beatriz Costa', 'Estoquista', '07:00 - 16:00', '2200.00', '2023-01-10');

-- Alterações nas tabelas para adicionar chaves estrangeiras

ALTER TABLE estoque
ADD FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor);

ALTER TABLE compras
ADD FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor);

ALTER TABLE compras
ADD FOREIGN KEY (id_item) REFERENCES estoque(id_item);

ALTER TABLE feedback
ADD FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);
