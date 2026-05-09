; DESCRIPTION: Creates a yellow circular shape at (204, 242) with radius 10.
; PLAN: r0=204(x), r1=242(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 242
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
