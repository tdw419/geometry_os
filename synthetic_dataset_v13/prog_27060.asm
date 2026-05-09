; DESCRIPTION: Draws a black rectangle at (158, 26) with width 111 and height 51.
; PLAN: r0=158(x), r1=26(y), r2=111(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 26
LDI r2, 111
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
