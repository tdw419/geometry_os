; DESCRIPTION: Draws a yellow circle centered at (376, 148) with radius 10.
; PLAN: r0=376(x), r1=148(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 148
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
