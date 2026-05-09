; DESCRIPTION: Renders a orange disk with center (250, 175) and radius 35.
; PLAN: r0=250(x), r1=175(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 175
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
