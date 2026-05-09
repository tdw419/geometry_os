; DESCRIPTION: Draws a black rectangle at (195, 88) with width 86 and height 114.
; PLAN: r0=195(x), r1=88(y), r2=86(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 88
LDI r2, 86
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
