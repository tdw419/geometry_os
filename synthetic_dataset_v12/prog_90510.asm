; DESCRIPTION: Creates a purple circular shape at (151, 185) with radius 17.
; PLAN: r0=151(x), r1=185(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 185
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
