; DESCRIPTION: Renders a orange disk with center (86, 155) and radius 32.
; PLAN: r0=86(x), r1=155(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 155
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
