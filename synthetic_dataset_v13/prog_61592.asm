; DESCRIPTION: Draws a yellow rectangle at (309, 51) with width 31 and height 47.
; PLAN: r0=309(x), r1=51(y), r2=31(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 51
LDI r2, 31
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
