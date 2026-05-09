; DESCRIPTION: Renders a black disk with center (252, 44) and radius 28.
; PLAN: r0=252(x), r1=44(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 44
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
