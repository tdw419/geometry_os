; DESCRIPTION: Draws a purple circle centered at (413, 186) with radius 42.
; PLAN: r0=413(x), r1=186(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 186
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
