; input driven program
; initialization
  LDI r30, 234
  LDI r9, 64
  LDI r11, 3387
  LDI r7, 2896
  LDI r0, 0x37E8F2
main_0:
  IKEY r2
  CMPI r2, 34
  JNZ r2, key_1
  ANDI r11, r5, 48
  CMP r8, r15
  SAR r1, r11, r12
  SHLI r15, r12, 64
  SAR r2, r9, r3
  SHR r7, r5, r0
  LDI r27, 0
  LDI r5, 3741
  LDI r1, 0x379245
  LDI r11, 2575
  CIRCLE r27, r5, r1, r11
  LDI r31, 3065
  LDI r21, 128
  LDI r13, 245
  TEXT r31, r21, r13, "HELLO"
  FRAME
  JMP main_0
