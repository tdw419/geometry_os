; DESCRIPTION: Renders a orange disk with center (340, 185) and radius 37.
; PLAN: r0=340(x), r1=185(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 185
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
