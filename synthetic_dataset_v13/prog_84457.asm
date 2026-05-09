; DESCRIPTION: Creates a yellow circular shape at (273, 153) with radius 78.
; PLAN: r0=273(x), r1=153(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 153
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
