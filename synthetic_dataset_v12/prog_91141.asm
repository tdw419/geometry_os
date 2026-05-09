; DESCRIPTION: Draws a black rectangle at (285, 185) with width 51 and height 20.
; PLAN: r0=285(x), r1=185(y), r2=51(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 185
LDI r2, 51
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
