; DESCRIPTION: Draws a black rectangle at (163, 35) with width 51 and height 111.
; PLAN: r0=163(x), r1=35(y), r2=51(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 35
LDI r2, 51
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
