; DESCRIPTION: Renders a purple disk with center (297, 126) and radius 67.
; PLAN: r0=297(x), r1=126(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 126
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
