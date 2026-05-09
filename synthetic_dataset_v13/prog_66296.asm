; DESCRIPTION: Renders a purple disk with center (151, 103) and radius 64.
; PLAN: r0=151(x), r1=103(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 103
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
