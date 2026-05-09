; DESCRIPTION: Renders a purple disk with center (234, 192) and radius 55.
; PLAN: r0=234(x), r1=192(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 192
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
