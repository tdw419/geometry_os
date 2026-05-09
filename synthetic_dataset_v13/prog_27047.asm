; DESCRIPTION: Creates a yellow circular shape at (274, 149) with radius 75.
; PLAN: r0=274(x), r1=149(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 149
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
