; DESCRIPTION: Renders a black disk with center (178, 152) and radius 40.
; PLAN: r0=178(x), r1=152(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 152
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
