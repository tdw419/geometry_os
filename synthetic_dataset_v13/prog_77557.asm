; DESCRIPTION: Creates a yellow circular shape at (204, 168) with radius 76.
; PLAN: r0=204(x), r1=168(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 168
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
