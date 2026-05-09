; DESCRIPTION: Renders a purple disk with center (470, 236) and radius 19.
; PLAN: r0=470(x), r1=236(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 236
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
