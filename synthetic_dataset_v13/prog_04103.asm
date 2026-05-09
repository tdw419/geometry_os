; DESCRIPTION: Draws a black rectangle at (205, 132) with width 24 and height 115.
; PLAN: r0=205(x), r1=132(y), r2=24(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 132
LDI r2, 24
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
