; DESCRIPTION: Renders a purple disk with center (307, 101) and radius 33.
; PLAN: r0=307(x), r1=101(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 101
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
