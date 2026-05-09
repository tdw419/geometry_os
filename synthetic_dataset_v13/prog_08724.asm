; DESCRIPTION: Draws a purple circle centered at (199, 93) with radius 58.
; PLAN: r0=199(x), r1=93(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 93
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
