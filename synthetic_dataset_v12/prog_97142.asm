; DESCRIPTION: Renders a purple disk with center (392, 158) and radius 44.
; PLAN: r0=392(x), r1=158(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 158
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
