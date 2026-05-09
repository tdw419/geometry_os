; DESCRIPTION: Renders a red disk with center (430, 49) and radius 47.
; PLAN: r0=430(x), r1=49(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 49
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
