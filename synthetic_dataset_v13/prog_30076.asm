; DESCRIPTION: Renders a black disk with center (271, 28) and radius 23.
; PLAN: r0=271(x), r1=28(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 28
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
