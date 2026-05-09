; DESCRIPTION: Creates a yellow circular shape at (160, 225) with radius 22.
; PLAN: r0=160(x), r1=225(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 225
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
