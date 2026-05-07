; input driven program
; initialization
  LDI r9, 2
  LDI r10, 0x73786D
  LDI r0, 0x5C7493
  LDI r11, 3523
  LDI r15, 16
  LDI r14, 1
main_0:
  IKEY r3
  CMPI r3, 0xD2A391
  JNZ r3, key_1
  LDI r9, 529
  LDI r13, 3832
  LDI r30, 0xFAC9B0
  TEXT r9, r13, r30, "HELLO"
  LDI r10, 10
  FILL r10
  FRAME
  JMP main_0
