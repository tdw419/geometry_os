; DESCRIPTION: Draws a red circle centered at (263, 159) with radius 51.
; PLAN: r0=263(x), r1=159(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 159
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
