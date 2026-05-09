; DESCRIPTION: Renders a purple disk with center (235, 214) and radius 41.
; PLAN: r0=235(x), r1=214(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 214
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
