; DESCRIPTION: Draws a purple circle centered at (193, 168) with radius 37.
; PLAN: r0=193(x), r1=168(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 168
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
