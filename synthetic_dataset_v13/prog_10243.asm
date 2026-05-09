; DESCRIPTION: Renders a purple disk with center (313, 33) and radius 26.
; PLAN: r0=313(x), r1=33(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 33
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
