; DESCRIPTION: Renders a purple disk with center (207, 90) and radius 55.
; PLAN: r0=207(x), r1=90(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 90
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
