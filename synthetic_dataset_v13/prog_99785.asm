; DESCRIPTION: Draws a black rectangle at (94, 85) with width 102 and height 84.
; PLAN: r0=94(x), r1=85(y), r2=102(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 85
LDI r2, 102
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
