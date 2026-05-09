; DESCRIPTION: Renders a black disk with center (277, 139) and radius 68.
; PLAN: r0=277(x), r1=139(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 139
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
