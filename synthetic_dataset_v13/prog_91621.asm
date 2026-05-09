; DESCRIPTION: Draws a green circle centered at (312, 77) with radius 48.
; PLAN: r0=312(x), r1=77(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 77
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
