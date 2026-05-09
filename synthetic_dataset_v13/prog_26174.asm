; DESCRIPTION: Renders a white disk with center (441, 128) and radius 30.
; PLAN: r0=441(x), r1=128(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 128
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
