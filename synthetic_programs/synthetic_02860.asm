; input driven program
; initialization
  LDI r12, 2415
  LDI r5, 2893
  LDI r13, 2415
  LDI r8, 2202
  LDI r7, 0xFA196D
main_0:
  OR r9, r15, r7
  XOR r9, r14, r10
  AND r12, r5, r9
  LDI r5, 1
  LDI r9, 0x1E3B35
  LDI r9, 10
  LDI r0, 32
  LDI r15, 0x121A1F
  RECTF r5, r9, r9, r0, r15
  ANDI r11, r12, 32
  FRAME
  JMP main_0
