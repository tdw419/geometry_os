; DESCRIPTION: Renders a purple disk with center (271, 126) and radius 47.
; PLAN: r0=271(x), r1=126(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 126
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
