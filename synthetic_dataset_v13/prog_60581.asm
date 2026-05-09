; DESCRIPTION: Renders a purple disk with center (276, 92) and radius 48.
; PLAN: r0=276(x), r1=92(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 92
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
