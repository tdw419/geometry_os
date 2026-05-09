; DESCRIPTION: Renders a purple disk with center (60, 235) and radius 18.
; PLAN: r0=60(x), r1=235(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 235
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
