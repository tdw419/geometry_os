; DESCRIPTION: Renders a purple disk with center (87, 166) and radius 69.
; PLAN: r0=87(x), r1=166(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 166
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
