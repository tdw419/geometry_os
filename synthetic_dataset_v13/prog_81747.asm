; DESCRIPTION: Renders a red disk with center (358, 81) and radius 67.
; PLAN: r0=358(x), r1=81(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 81
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
