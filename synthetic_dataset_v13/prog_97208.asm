; DESCRIPTION: Renders a orange disk with center (19, 234) and radius 16.
; PLAN: r0=19(x), r1=234(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 234
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
