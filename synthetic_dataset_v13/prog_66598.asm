; DESCRIPTION: Draws a yellow circle centered at (245, 111) with radius 79.
; PLAN: r0=245(x), r1=111(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 111
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
