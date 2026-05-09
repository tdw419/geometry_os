; DESCRIPTION: Creates a yellow circular shape at (423, 128) with radius 24.
; PLAN: r0=423(x), r1=128(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 128
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
