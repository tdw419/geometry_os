; DESCRIPTION: Renders a purple disk with center (133, 150) and radius 70.
; PLAN: r0=133(x), r1=150(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 150
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
