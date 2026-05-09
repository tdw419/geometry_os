; DESCRIPTION: Draws a black rectangle at (111, 15) with width 96 and height 97.
; PLAN: r0=111(x), r1=15(y), r2=96(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 15
LDI r2, 96
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
