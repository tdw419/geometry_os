; DESCRIPTION: Renders a purple disk with center (329, 171) and radius 24.
; PLAN: r0=329(x), r1=171(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 171
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
