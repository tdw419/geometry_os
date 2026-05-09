; DESCRIPTION: Draws a yellow circle centered at (237, 137) with radius 77.
; PLAN: r0=237(x), r1=137(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 137
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
