; DESCRIPTION: Draws a red circle centered at (496, 234) with radius 10.
; PLAN: r0=496(x), r1=234(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 496
LDI r1, 234
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
