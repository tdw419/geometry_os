; DESCRIPTION: Renders a orange disk with center (292, 94) and radius 35.
; PLAN: r0=292(x), r1=94(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 94
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
