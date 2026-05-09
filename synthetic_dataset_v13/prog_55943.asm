; DESCRIPTION: Renders a purple disk with center (120, 116) and radius 22.
; PLAN: r0=120(x), r1=116(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 116
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
