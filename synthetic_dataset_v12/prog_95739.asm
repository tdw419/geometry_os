; DESCRIPTION: Creates a purple circular shape at (240, 171) with radius 79.
; PLAN: r0=240(x), r1=171(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 171
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
