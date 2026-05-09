; DESCRIPTION: Creates a purple circular shape at (248, 126) with radius 43.
; PLAN: r0=248(x), r1=126(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 126
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
