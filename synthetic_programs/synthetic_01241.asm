; input driven program
; initialization
  LDI r15, 729
  LDI r4, 10
  LDI r8, 0x10EF9E
  LDI r3, 1518
  LDI r1, 2417
  LDI r6, 1292
  LDI r9, 0x5A6A9B
main_0:
  CMPI r0, 0x4AF749
  SHL r10, r1, r5
  SHR r9, r15, r14
  SHR r11, r10, r4
  CMPI r9, 0x42138A
  IKEY r3
  CMPI r3, 0x44C418
  JNZ r3, key_1
  FRAME
  JMP main_0
