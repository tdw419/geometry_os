; DESCRIPTION: Creates a purple circular shape at (111, 65) with radius 40.
; PLAN: r0=111(x), r1=65(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 65
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
