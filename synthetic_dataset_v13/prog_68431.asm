; DESCRIPTION: Creates a purple circular shape at (212, 186) with radius 50.
; PLAN: r0=212(x), r1=186(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 186
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
