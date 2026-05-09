; DESCRIPTION: Renders a purple disk with center (287, 176) and radius 72.
; PLAN: r0=287(x), r1=176(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 176
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
