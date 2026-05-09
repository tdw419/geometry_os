; DESCRIPTION: Renders a purple disk with center (210, 108) and radius 75.
; PLAN: r0=210(x), r1=108(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 108
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
