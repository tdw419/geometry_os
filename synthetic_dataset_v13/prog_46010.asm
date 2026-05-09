; DESCRIPTION: Draws a yellow circle centered at (334, 169) with radius 27.
; PLAN: r0=334(x), r1=169(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 169
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
