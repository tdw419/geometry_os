; DESCRIPTION: Renders a purple disk with center (415, 189) and radius 67.
; PLAN: r0=415(x), r1=189(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 189
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
