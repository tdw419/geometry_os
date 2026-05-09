; DESCRIPTION: Creates a purple circular shape at (277, 163) with radius 25.
; PLAN: r0=277(x), r1=163(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 163
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
