; DESCRIPTION: Renders a purple disk with center (161, 171) and radius 32.
; PLAN: r0=161(x), r1=171(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 171
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
