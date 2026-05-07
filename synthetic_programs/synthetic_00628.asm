; mixed program
; initialization
  LDI r6, 1
  LDI r8, 0x0C8E19
  LDI r0, 64
  LDI r5, 32
  LDI r5, 128
  LDI r9, 0x238865
  LDI r5, 684
  TEXT r5, r9, r5, "HELLO"
  ADD r0, r13, r9
  XOR r12, r0, r6
  OR r8, r12, r0
  OR r21, r15, r12
  CALL func_0
func_0:
  SUB r0, r6, r14
  DIV r14, r6, r2
  MUL r14, r7, r15
  DIV r3, r5, r4
  XOR r14, r6, r2
  RET
  XOR r0, r8, r12
  OR r8, r12, r14
  AND r4, r1, r5
  OR r14, r7, r1
  CMP r11, r7
  JZ r11, else_1
  XOR r5, r12, r10
  ADD r7, r9, r13
  SHL r3, r7, r13
  JMP endif_2
else_1:
  LDI r13, 1
  LDI r4, 0
  LDI r10, 256
  PSETI
  LDI r8, 3348
  LDI r2, 0x8C0004
  LDI r14, 2
  LDI r14, 60
  LDI r1, 0x259527
  RECTF r8, r2, r14, r14, r1
endif_2:
  LDI r10, 64
  LDI r7, 2
  LDI r14, 3919
  DRAWTEXT r10, r7, r14, "WORLD"
  XOR r15, r13, r7
  OR r7, r6, r13
  AND r12, r3, r4
  AND r8, r2, r5
  HALT
