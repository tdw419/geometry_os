; mixed program
; initialization
  LDI r14, 0x0C3BCF
  LDI r4, 3268
  CALL func_0
func_0:
  DIV r1, r3, r0
  MUL r11, r2, r15
  SHR r8, r10, r23
  RET
  LDI r8, 0x9226A6
  LDI r15, 3649
  LDI r0, 10
  TEXT r8, r15, r0, "HELLO"
  CMP r6, r0
  JNZ r6, else_1
  SUB r5, r7, r1
  XOR r13, r5, r0
  JMP endif_2
else_1:
  LDI r15, 256
  LDI r12, 0xB3492B
  LDI r15, 16
  LDI r6, 540
  LDI r4, 3946
  RECTF r15, r12, r15, r6, r4
  LDI r23, 2781
  LDI r12, 0
  LDI r9, 16
  PSET r23, r12, r9
  LDI r6, 16
  LDI r7, 3009
  LDI r0, 1
  LDI r10, 64
  LDI r13, 10
  LINE r6, r7, r0, r10, r13
  LDI r6, 2988
  LDI r13, 0x58B3DE
  LDI r1, 4096
  LDI r6, 255
  CIRCLE r6, r13, r1, r6
endif_2:
  AND r9, r8, r6
  HALT
