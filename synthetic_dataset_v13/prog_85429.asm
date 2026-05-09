; DESCRIPTION: Draws a cyan rectangle at (390, 88) with width 64 and height 90.
; PLAN: r0=390(x), r1=88(y), r2=64(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 88
LDI r2, 64
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
