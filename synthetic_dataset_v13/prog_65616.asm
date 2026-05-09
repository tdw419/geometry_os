; DESCRIPTION: Creates a purple circular shape at (403, 163) with radius 39.
; PLAN: r0=403(x), r1=163(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 163
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
