; input driven program
; initialization
  LDI r9, 4070
  LDI r1, 32
main_0:
  LDI r6, 64
  LDI r13, 0x903E25
  LDI r9, 3721
  LDI r11, 2500
  LDI r5, 255
  RECTF r6, r13, r9, r11, r5
  LDI r14, 256
  LDI r8, 2162
  LDI r13, 16
  DRAWTEXT r14, r8, r13, "WORLD"
  CMPI r6, r2, 32
  ADDI r6, r8, 161
  IKEY r7
  CMPI r7, 102
  JNZ r7, key_1
  FRAME
  JMP main_0
