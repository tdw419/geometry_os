; DESCRIPTION: Renders a orange disk with center (63, 136) and radius 57.
; PLAN: r0=63(x), r1=136(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 136
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
