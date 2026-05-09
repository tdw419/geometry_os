; DESCRIPTION: Renders a orange disk with center (138, 144) and radius 61.
; PLAN: r0=138(x), r1=144(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 144
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
