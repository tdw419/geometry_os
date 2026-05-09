; DESCRIPTION: Renders a white disk with center (396, 63) and radius 63.
; PLAN: r0=396(x), r1=63(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 63
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
