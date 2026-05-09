; DESCRIPTION: Creates a purple circular shape at (385, 138) with radius 13.
; PLAN: r0=385(x), r1=138(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 138
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
