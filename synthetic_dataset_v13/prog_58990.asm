; DESCRIPTION: Renders a purple disk with center (102, 151) and radius 20.
; PLAN: r0=102(x), r1=151(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 151
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
