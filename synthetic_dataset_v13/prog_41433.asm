; DESCRIPTION: Creates a purple circular shape at (111, 220) with radius 17.
; PLAN: r0=111(x), r1=220(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 220
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
