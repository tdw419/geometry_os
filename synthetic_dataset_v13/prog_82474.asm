; DESCRIPTION: Draws a yellow rectangle at (234, 134) with width 51 and height 52.
; PLAN: r0=234(x), r1=134(y), r2=51(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 134
LDI r2, 51
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
