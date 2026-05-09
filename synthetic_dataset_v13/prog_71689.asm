; DESCRIPTION: Places a purple circle of radius 38 at center (264, 190).
; PLAN: r0=264(x), r1=190(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 190
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
