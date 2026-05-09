; DESCRIPTION: Creates a yellow circular shape at (270, 195) with radius 20.
; PLAN: r0=270(x), r1=195(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 195
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
