; DESCRIPTION: Draws a red circle centered at (427, 146) with radius 51.
; PLAN: r0=427(x), r1=146(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 146
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
