; DESCRIPTION: Draws a green rectangle at (234, 144) with width 51 and height 92.
; PLAN: r0=234(x), r1=144(y), r2=51(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 144
LDI r2, 51
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
