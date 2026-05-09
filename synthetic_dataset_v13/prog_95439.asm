; DESCRIPTION: Draws a red circle centered at (195, 66) with radius 61.
; PLAN: r0=195(x), r1=66(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 66
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
