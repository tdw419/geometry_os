; DESCRIPTION: Draws a black rectangle at (282, 132) with width 99 and height 39.
; PLAN: r0=282(x), r1=132(y), r2=99(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 132
LDI r2, 99
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
