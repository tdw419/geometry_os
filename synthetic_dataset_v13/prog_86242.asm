; DESCRIPTION: Renders a purple disk with center (253, 230) and radius 16.
; PLAN: r0=253(x), r1=230(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 230
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
