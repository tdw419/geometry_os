; DESCRIPTION: Creates a purple circular shape at (59, 222) with radius 22.
; PLAN: r0=59(x), r1=222(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 222
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
