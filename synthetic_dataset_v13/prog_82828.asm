; DESCRIPTION: Creates a yellow circular shape at (237, 60) with radius 28.
; PLAN: r0=237(x), r1=60(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 60
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
