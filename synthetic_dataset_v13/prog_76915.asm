; DESCRIPTION: Renders a orange disk with center (44, 220) and radius 33.
; PLAN: r0=44(x), r1=220(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 220
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
