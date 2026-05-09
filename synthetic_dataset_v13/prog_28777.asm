; DESCRIPTION: Creates a purple circular shape at (394, 209) with radius 31.
; PLAN: r0=394(x), r1=209(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 209
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
