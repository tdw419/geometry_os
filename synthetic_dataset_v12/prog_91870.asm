; DESCRIPTION: Creates a yellow circular shape at (319, 76) with radius 14.
; PLAN: r0=319(x), r1=76(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 76
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
