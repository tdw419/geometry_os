; mixed program
; initialization
  LDI r1, 8
  LDI r12, 0xAE46F7
  LDI r0, 0
  LDI r3, 685
  LDI r15, 0x1B0346
  LDI r4, 2
  LDI r13, 8
  IKEY r1
  CMPI r1, 32
  JNZ r1, key_0
  CMP r10, r5
  JZ r10, else_1
  MOD r1, r27, r14
  DIV r11, r13, r12
  ADD r14, r8, r10
  JMP endif_2
else_1:
  LDI r7, 0xC60454
  LDI r2, 1639
  LDI r13, 255
  PSET r7, r2, r13
endif_2:
  CMPI r5, 2
  LDI r5, 0x84FE22
  LDI r14, 2614
  LDI r9, 1369
  TEXT r5, r14, r9, "HELLO"
main_3:
  SAR r8, r14, r11
  SAR r10, r22, r13
  SHLI r11, r1, 0x01AA5F
  MUL r2, r15, r6
  SHL r6, r10, r14
  SAR r7, r6, r4
  OR r6, r7, r10
  AND r27, r6, r9
  CMPI r0, r13, 77
  FRAME
  JMP main_3
