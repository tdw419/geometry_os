; DESCRIPTION: Creates a yellow circular shape at (466, 99) with radius 29.
; PLAN: r0=466(x), r1=99(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 99
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
