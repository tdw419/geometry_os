; DESCRIPTION: Draws a purple circle centered at (468, 211) with radius 42.
; PLAN: r0=468(x), r1=211(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 211
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
