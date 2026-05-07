; input driven program
; initialization
  LDI r2, 484
  LDI r8, 255
  LDI r1, 1019
  LDI r6, 3011
main_0:
  LDI r14, 1
  LDI r5, 565
  LDI r11, 1074
  LDI r15, 3002
  LDI r9, 1550
  RECTF r14, r5, r11, r15, r9
  SHR r4, r14, r11
  SAR r7, r14, r11
  SAR r4, r14, r20
  ADDI r2, r13, 121
  SHLI r10, r9, 0x845A8A
  SAR r2, r14, r1
  SHLI r1, r10, 0xD35C36
  SHR r8, r10, r5
  IKEY r9
  CMPI r9, 0x12565E
  JNZ r9, key_1
  LDI r8, 256
  LDI r11, 32
  LDI r13, 0x2F3450
  LDI r13, 0xB9BC04
  CIRCLE r8, r11, r13, r13
  FRAME
  JMP main_0
