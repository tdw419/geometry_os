; DESCRIPTION: Creates a purple circular shape at (244, 108) with radius 71.
; PLAN: r0=244(x), r1=108(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 108
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
