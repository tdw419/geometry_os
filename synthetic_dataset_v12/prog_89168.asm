; DESCRIPTION: Renders a orange disk with center (321, 139) and radius 68.
; PLAN: r0=321(x), r1=139(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 139
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
