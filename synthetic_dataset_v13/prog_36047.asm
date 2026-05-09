; DESCRIPTION: Renders a red disk with center (58, 83) and radius 11.
; PLAN: r0=58(x), r1=83(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 83
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
