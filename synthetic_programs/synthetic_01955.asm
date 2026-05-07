; input driven program
; initialization
  LDI r14, 183
  LDI r2, 1421
  LDI r15, 1586
  LDI r4, 0xFFE036
  LDI r5, 32
  LDI r0, 0x93B7B3
main_0:
  CMP r6, r1
  CMP r9, r12
  LDI r4, 32
  LDI r12, 3402
  LDI r3, 3057
  LDI r28, 0x26078D
  LDI r15, 2
  RECTF r4, r12, r3, r28, r15
  IKEY r25
  CMPI r25, 101
  JNZ r25, key_1
  ADD r15, r26, r11
  FRAME
  JMP main_0
