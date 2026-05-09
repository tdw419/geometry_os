; DESCRIPTION: Creates a yellow circular shape at (302, 76) with radius 15.
; PLAN: r0=302(x), r1=76(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 76
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
