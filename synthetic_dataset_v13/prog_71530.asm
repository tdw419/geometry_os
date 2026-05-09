; DESCRIPTION: Creates a purple circular shape at (383, 59) with radius 10.
; PLAN: r0=383(x), r1=59(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 59
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
