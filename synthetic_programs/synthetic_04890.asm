; mixed program
; initialization
  LDI r10, 1405
  LDI r25, 0
  LDI r15, 2
  LDI r3, 16
  LDI r6, 2
  LDI r14, 3168
  LDI r8, 0
  LDI r7, 10
  CALL func_0
func_0:
  MUL r1, r15, r2
  OR r1, r23, r3
  XOR r26, r13, r14
  SUB r1, r0, r4
  RET
  CMP r9, r10
  JZ r9, else_1
  MOD r9, r3, r0
  OR r11, r2, r3
  DIV r13, r15, r12
  JMP endif_2
else_1:
  LDI r12, 128
  LDI r2, 10
  LDI r3, 8
  PSET r12, r2, r3
  LDI r0, 0
  LDI r14, 0x4459BA
  LDI r7, 246
  PSET r0, r14, r7
  LDI r12, 0xDC8276
  LDI r3, 0
  LDI r2, 0xDE81B3
  LDI r9, 64
  LDI r1, 256
  RECTF r12, r3, r2, r9, r1
  LDI r14, 893
  LDI r3, 0xDA05C6
  LDI r13, 128
  LDI r10, 3212
  CIRCLE r14, r3, r13, r10
endif_2:
  OR r4, r30, r0
  IKEY r3
  CMPI r3, 0x182E59
  JNZ r3, key_3
main_4:
  SHR r10, r9, r11
  ADDI r0, r9, 0xDE15FE
  LDI r2, 0x262726
  LDI r4, 1524
  LDI r3, 325
  TEXT r2, r4, r3, "HELLO"
  LDI r9, 3800
  LDI r10, 3862
  LDI r2, 16
  PSET r9, r10, r2
  FRAME
  JMP main_4
