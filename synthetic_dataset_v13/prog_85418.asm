; DESCRIPTION: Renders a purple disk with center (86, 162) and radius 56.
; PLAN: r0=86(x), r1=162(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 162
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
