; DESCRIPTION: Draws a cyan rectangle at (155, 135) with width 88 and height 90.
; PLAN: r0=155(x), r1=135(y), r2=88(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 135
LDI r2, 88
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
