; DESCRIPTION: Creates a yellow circular shape at (144, 108) with radius 75.
; PLAN: r0=144(x), r1=108(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 108
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
