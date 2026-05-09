; DESCRIPTION: Draws a yellow circle centered at (148, 109) with radius 56.
; PLAN: r0=148(x), r1=109(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 109
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
