; DESCRIPTION: Draws a purple circle centered at (212, 93) with radius 62.
; PLAN: r0=212(x), r1=93(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 93
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
