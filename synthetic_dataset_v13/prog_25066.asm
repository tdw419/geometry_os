; DESCRIPTION: Renders a orange disk with center (292, 218) and radius 36.
; PLAN: r0=292(x), r1=218(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 218
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
