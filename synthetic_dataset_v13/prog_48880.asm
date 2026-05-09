; DESCRIPTION: Renders a black disk with center (16, 31) and radius 14.
; PLAN: r0=16(x), r1=31(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 31
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
