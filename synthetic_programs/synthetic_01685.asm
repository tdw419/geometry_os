; mixed program
; initialization
  LDI r15, 1601
  LDI r4, 3715
  LDI r10, 0xC312A3
  PUSH r4
  PUSH r12
  SHL r14, r11, r0
  DIV r13, r0, r6
  XOR r10, r11, r13
  POP r12
  POP r4
  CMP r4, r1
  JZ r4, else_0
  ADD r5, r6, r10
  JMP endif_1
else_0:
  LDI r6, 0
  LDI r0, 0x74F963
  LDI r15, 0xB226D6
  LDI r3, 0xF55A8A
  CIRCLE r6, r0, r15, r3
  LDI r11, 16
  LDI r12, 0xC71577
  LDI r12, 256
  LDI r9, 1348
  LDI r13, 2695
  LINE r11, r12, r12, r9, r13
  LDI r5, 1
  FILL r5
endif_1:
  PUSH r12
  SHL r13, r11, r14
  OR r13, r14, r0
  DIV r6, r9, r14
  POP r12
  LDI r4, 1377
  LDI r14, 4093
  LDI r13, 754
  TEXT r4, r14, r13, "HELLO"
  CALL func_2
func_2:
  MUL r13, r2, r8
  SHL r9, r6, r13
  MOD r3, r9, r8
  ADD r12, r9, r0
  ADD r14, r13, r2
  SHR r15, r5, r0
  RET
  LDI r28, 0x1945C1
  LDI r10, 3921
  LDI r20, 255
  DRAWTEXT r28, r10, r20, "WORLD"
  HALT
