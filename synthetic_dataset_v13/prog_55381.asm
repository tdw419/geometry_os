; DESCRIPTION: Renders a orange disk with center (428, 76) and radius 52.
; PLAN: r0=428(x), r1=76(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 76
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
