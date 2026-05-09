; DESCRIPTION: Draws a green rectangle at (328, 16) with width 15 and height 20.
; PLAN: r0=328(x), r1=16(y), r2=15(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 16
LDI r2, 15
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
