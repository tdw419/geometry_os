; DESCRIPTION: Creates a purple circular shape at (305, 190) with radius 50.
; PLAN: r0=305(x), r1=190(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 190
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
