; DESCRIPTION: Renders a white disk with center (285, 128) and radius 47.
; PLAN: r0=285(x), r1=128(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 128
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
