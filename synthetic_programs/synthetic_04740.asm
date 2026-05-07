; input driven program
; initialization
  LDI r10, 0xBC02D8
  LDI r9, 0x4CADA8
  LDI r8, 0x4D09A7
  LDI r4, 32
main_0:
  LDI r6, 256
  LDI r6, 255
  LDI r1, 256
  LDI r5, 3360
  LDI r9, 4
  RECTF r6, r6, r1, r5, r9
  XOR r2, r29, r15
  AND r27, r2, r31
  XOR r8, r9, r1
  OR r18, r8, r11
  FRAME
  JMP main_0
