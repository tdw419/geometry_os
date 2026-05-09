; DESCRIPTION: Renders a purple disk with center (207, 72) and radius 68.
; PLAN: r0=207(x), r1=72(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 72
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
