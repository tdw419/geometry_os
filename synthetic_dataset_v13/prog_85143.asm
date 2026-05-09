; DESCRIPTION: Renders a purple disk with center (196, 92) and radius 37.
; PLAN: r0=196(x), r1=92(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 92
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
