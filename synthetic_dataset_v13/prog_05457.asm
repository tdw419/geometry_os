; DESCRIPTION: Renders a purple disk with center (36, 44) and radius 14.
; PLAN: r0=36(x), r1=44(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 44
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
