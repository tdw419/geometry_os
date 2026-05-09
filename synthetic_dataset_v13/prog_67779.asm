; DESCRIPTION: Renders a purple disk with center (473, 64) and radius 11.
; PLAN: r0=473(x), r1=64(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 64
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
