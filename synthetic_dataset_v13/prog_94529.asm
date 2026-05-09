; DESCRIPTION: Renders a orange disk with center (179, 139) and radius 38.
; PLAN: r0=179(x), r1=139(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 139
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
