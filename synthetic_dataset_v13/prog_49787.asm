; DESCRIPTION: Draws a red rectangle at (341, 132) with width 51 and height 96.
; PLAN: r0=341(x), r1=132(y), r2=51(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 132
LDI r2, 51
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
