; DESCRIPTION: Renders a white disk with center (128, 89) and radius 47.
; PLAN: r0=128(x), r1=89(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 89
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
