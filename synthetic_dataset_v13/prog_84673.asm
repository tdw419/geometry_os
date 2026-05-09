; DESCRIPTION: Draws a black rectangle at (136, 61) with width 25 and height 86.
; PLAN: r0=136(x), r1=61(y), r2=25(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 61
LDI r2, 25
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
