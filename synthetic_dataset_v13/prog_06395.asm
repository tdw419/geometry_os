; DESCRIPTION: Renders a orange disk with center (229, 48) and radius 47.
; PLAN: r0=229(x), r1=48(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 48
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
