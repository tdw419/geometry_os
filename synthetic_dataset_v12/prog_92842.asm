; DESCRIPTION: Renders a purple disk with center (271, 167) and radius 38.
; PLAN: r0=271(x), r1=167(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 167
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
