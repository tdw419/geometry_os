; DESCRIPTION: Creates a yellow circular shape at (435, 109) with radius 24.
; PLAN: r0=435(x), r1=109(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 109
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
