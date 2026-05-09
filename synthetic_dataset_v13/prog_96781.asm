; DESCRIPTION: Renders a red disk with center (334, 144) and radius 69.
; PLAN: r0=334(x), r1=144(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 144
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
