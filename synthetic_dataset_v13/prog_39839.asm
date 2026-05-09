; DESCRIPTION: Renders a orange disk with center (454, 188) and radius 36.
; PLAN: r0=454(x), r1=188(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 188
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
