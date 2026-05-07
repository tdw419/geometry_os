; mixed program
; initialization
  LDI r1, 3525
  LDI r14, 2142
  LDI r11, 0xB6EFC8
  LDI r10, 16
  LDI r2, 0x94AA3D
  LDI r13, 1
  LDI r9, 128
  CALL func_0
func_0:
  DIV r2, r7, r9
  OR r28, r2, r6
  AND r10, r8, r9
  RET
  CMP r11, r13
  JZ r11, else_1
  MUL r14, r15, r5
  ADD r2, r5, r26
  AND r11, r5, r25
  JMP endif_2
else_1:
  LDI r7, 3333
  LDI r6, 0xC232DE
  LDI r4, 0x9DD40B
  PSET r7, r6, r4
  LDI r15, 10
  FILL r15
endif_2:
  DIV r10, r3, r16
  LDI r15, 2480
  STORE r15, r5
  LOAD r7, r15
  LDI r9, 2797
  STORE r9, r9
  LOAD r13, r9
  LDI r13, 0x0D3D81
  LDI r13, 4
  LDI r14, 1112
  LDI r4, 1
  CIRCLE r13, r13, r14, r4
  CMP r2, r15
  JZ r2, else_3
  DIV r8, r9, r3
  MUL r5, r10, r11
  MUL r0, r5, r2
  ADD r0, r10, r9
  JMP endif_4
else_3:
  LDI r15, 8
  LDI r3, 2616
  LDI r1, 0x85ADF8
  PSET r15, r3, r1
endif_4:
  CALL func_5
func_5:
  SHR r0, r15, r12
  MUL r11, r2, r4
  SUB r7, r17, r10
  XOR r4, r7, r6
  SUB r0, r9, r8
  OR r2, r15, r12
  RET
  LDI r6, 8
  STORE r6, r2
  LOAD r5, r6
  LDI r15, 1461
  STORE r15, r7
  LOAD r14, r15
  LDI r0, 0xF9140B
  STORE r0, r10
  LOAD r7, r0
  HALT
