; DESCRIPTION: Renders a orange disk with center (70, 78) and radius 31.
; PLAN: r0=70(x), r1=78(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 78
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
