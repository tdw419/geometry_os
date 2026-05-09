; DESCRIPTION: Renders a black disk with center (247, 152) and radius 37.
; PLAN: r0=247(x), r1=152(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 152
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
