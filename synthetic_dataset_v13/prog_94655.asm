; DESCRIPTION: Creates a yellow circular shape at (393, 153) with radius 59.
; PLAN: r0=393(x), r1=153(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 153
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
