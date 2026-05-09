; DESCRIPTION: Renders a orange disk with center (237, 169) and radius 78.
; PLAN: r0=237(x), r1=169(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 169
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
