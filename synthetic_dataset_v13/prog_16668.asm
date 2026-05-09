; DESCRIPTION: Renders a orange disk with center (420, 179) and radius 38.
; PLAN: r0=420(x), r1=179(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 179
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
