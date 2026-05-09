; DESCRIPTION: Creates a yellow circular shape at (263, 61) with radius 60.
; PLAN: r0=263(x), r1=61(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 61
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
