; DESCRIPTION: Renders a purple disk with center (313, 154) and radius 33.
; PLAN: r0=313(x), r1=154(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 154
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
