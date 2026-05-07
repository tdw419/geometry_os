; input driven program
; initialization
  LDI r13, 255
  LDI r15, 1493
  LDI r28, 0x15EFAB
  LDI r7, 128
  LDI r2, 3091
  LDI r9, 0x2DAC8E
  LDI r12, 128
  LDI r0, 4
main_0:
  CMP r7, r0
  IKEY r8
  CMPI r8, 0x9D5944
  JNZ r8, key_1
  CMP r8, r5
  LDI r14, 1191
  LDI r11, 16
  LDI r0, 1493
  LDI r7, 1254
  CIRCLE r14, r11, r0, r7
  FRAME
  JMP main_0
