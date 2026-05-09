; DESCRIPTION: Renders a orange disk with center (418, 65) and radius 39.
; PLAN: r0=418(x), r1=65(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 65
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
