; DESCRIPTION: Renders a white disk with center (402, 103) and radius 25.
; PLAN: r0=402(x), r1=103(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 103
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
