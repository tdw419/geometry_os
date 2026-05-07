; Synthetic GeOS Program
; initialization
LDI r4, 0xFF00FF
LDI r2, 0x00FFFF
; main loop
loop_0:
  LDI r2, 8947848
  FILL r2
RECTF r8, r17, r3, r19, r9
RECTF r30, r5, r30, r11, r21
PSET r15, r11, r9
  CMP r5, r0
  JZ r0, loop_0
  FRAME
  JMP loop_0