; DESCRIPTION: Creates a purple circular shape at (303, 82) with radius 60.
; PLAN: r0=303(x), r1=82(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 82
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
