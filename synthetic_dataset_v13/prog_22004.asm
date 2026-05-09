; DESCRIPTION: Draws a purple circle centered at (120, 131) with radius 75.
; PLAN: r0=120(x), r1=131(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 131
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
