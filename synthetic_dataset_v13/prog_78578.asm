; DESCRIPTION: Renders a orange disk with center (283, 17) and radius 16.
; PLAN: r0=283(x), r1=17(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 17
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
