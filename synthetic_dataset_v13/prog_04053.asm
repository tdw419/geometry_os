; DESCRIPTION: Draws a black rectangle at (251, 167) with width 51 and height 25.
; PLAN: r0=251(x), r1=167(y), r2=51(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 167
LDI r2, 51
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
