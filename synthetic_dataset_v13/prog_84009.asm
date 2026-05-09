; DESCRIPTION: Draws a red circle centered at (51, 175) with radius 14.
; PLAN: r0=51(x), r1=175(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 175
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
