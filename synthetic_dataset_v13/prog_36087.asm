; DESCRIPTION: Renders a purple disk with center (428, 108) and radius 15.
; PLAN: r0=428(x), r1=108(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 108
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
