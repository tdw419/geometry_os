; DESCRIPTION: Creates a purple circular shape at (320, 138) with radius 72.
; PLAN: r0=320(x), r1=138(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 138
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
