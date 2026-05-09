; DESCRIPTION: Renders a purple disk with center (84, 69) and radius 42.
; PLAN: r0=84(x), r1=69(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 69
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
