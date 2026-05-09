; DESCRIPTION: Draws a red circle centered at (234, 123) with radius 33.
; PLAN: r0=234(x), r1=123(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 123
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
