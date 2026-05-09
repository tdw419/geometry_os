; DESCRIPTION: Renders a orange disk with center (237, 79) and radius 30.
; PLAN: r0=237(x), r1=79(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 79
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
