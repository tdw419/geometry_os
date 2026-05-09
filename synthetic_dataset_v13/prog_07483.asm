; DESCRIPTION: Renders a orange disk with center (176, 194) and radius 15.
; PLAN: r0=176(x), r1=194(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 194
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
