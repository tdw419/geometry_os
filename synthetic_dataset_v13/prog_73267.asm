; DESCRIPTION: Draws a black rectangle at (452, 66) with width 40 and height 51.
; PLAN: r0=452(x), r1=66(y), r2=40(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 66
LDI r2, 40
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
