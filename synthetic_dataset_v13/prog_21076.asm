; DESCRIPTION: Renders a purple disk with center (131, 92) and radius 54.
; PLAN: r0=131(x), r1=92(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 92
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
