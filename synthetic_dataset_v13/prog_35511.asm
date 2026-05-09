; DESCRIPTION: Renders a orange disk with center (329, 83) and radius 68.
; PLAN: r0=329(x), r1=83(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 83
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
