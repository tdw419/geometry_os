; DESCRIPTION: Creates a purple circular shape at (169, 190) with radius 17.
; PLAN: r0=169(x), r1=190(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 190
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
