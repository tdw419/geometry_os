; DESCRIPTION: Renders a black disk with center (312, 152) and radius 16.
; PLAN: r0=312(x), r1=152(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 152
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
