; DESCRIPTION: Draws a purple circle centered at (251, 127) with radius 49.
; PLAN: r0=251(x), r1=127(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 127
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
