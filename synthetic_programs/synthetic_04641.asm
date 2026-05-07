; mixed program
; initialization
  LDI r2, 3651
  LDI r0, 0x2CB07D
  LDI r1, 4
  LDI r6, 128
  LDI r0, 611
  TEXT r1, r6, r0, "HELLO"
  CMP r4, r1
  JNZ r4, else_0
  ADD r15, r5, r12
  SUB r10, r2, r0
  MUL r4, r5, r1
  JMP endif_1
else_0:
  LDI r11, 0x3B8801
  LDI r4, 8
  LDI r15, 8
  PSET r11, r4, r15
  LDI r0, 0
  LDI r8, 0x0A9352
  LDI r1, 0
  PSETI
endif_1:
  IKEY r5
  CMPI r5, 256
  JNZ r5, key_2
main_3:
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_4
  LDI r15, 2
  LDI r3, 476
  LDI r12, 0xCFD068
  TEXT r15, r3, r12, "HELLO"
  AND r13, r10, r12
  OR r15, r6, r4
  SAR r3, r10, r14
  SHLI r4, r9, 0xA30721
  SHL r13, r3, r15
  IKEY r3
  CMPI r3, 247
  JNZ r3, key_5
  ADDI r5, r11, 4
  FRAME
  JMP main_3
