; DESCRIPTION: Renders a purple disk with center (271, 164) and radius 47.
; PLAN: r0=271(x), r1=164(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 164
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
