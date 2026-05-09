; DESCRIPTION: Draws a yellow rectangle at (260, 11) with width 51 and height 40.
; PLAN: r0=260(x), r1=11(y), r2=51(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 11
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
