; DESCRIPTION: Renders a purple disk with center (441, 92) and radius 67.
; PLAN: r0=441(x), r1=92(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 92
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
