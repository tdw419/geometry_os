; DESCRIPTION: Draws a red circle centered at (66, 75) with radius 25.
; PLAN: r0=66(x), r1=75(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 75
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
