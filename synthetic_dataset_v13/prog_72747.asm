; DESCRIPTION: Renders a orange disk with center (249, 79) and radius 14.
; PLAN: r0=249(x), r1=79(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 79
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
