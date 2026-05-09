; DESCRIPTION: Draws a yellow rectangle at (391, 101) with width 51 and height 51.
; PLAN: r0=391(x), r1=101(y), r2=51(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 101
LDI r2, 51
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
