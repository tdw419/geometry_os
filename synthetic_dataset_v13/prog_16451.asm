; DESCRIPTION: Creates a purple circular shape at (91, 126) with radius 28.
; PLAN: r0=91(x), r1=126(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 126
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
