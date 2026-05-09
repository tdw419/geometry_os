; DESCRIPTION: Creates a black circular shape at (237, 188) with radius 14.
; PLAN: r0=237(x), r1=188(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 188
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
