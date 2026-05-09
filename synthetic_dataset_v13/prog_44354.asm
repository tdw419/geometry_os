; DESCRIPTION: Draws a black rectangle at (132, 38) with width 49 and height 107.
; PLAN: r0=132(x), r1=38(y), r2=49(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 38
LDI r2, 49
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
