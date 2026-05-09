; DESCRIPTION: Draws a black rectangle at (237, 6) with width 119 and height 91.
; PLAN: r0=237(x), r1=6(y), r2=119(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 6
LDI r2, 119
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
