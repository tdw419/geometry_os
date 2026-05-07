; input driven program
; initialization
  LDI r0, 0x68527B
  LDI r10, 0x486CF7
main_0:
  LDI r4, 0x300B0A
  FILL r4
  LDI r28, 0xCD4FB1
  LDI r5, 0xDE60DC
  LDI r5, 1432
  TEXT r28, r5, r5, "HELLO"
  LDI r8, 64
  LDI r5, 1084
  LDI r5, 1320
  WPIXEL
  XOR r15, r7, r1
  AND r12, r1, r11
  FRAME
  JMP main_0
