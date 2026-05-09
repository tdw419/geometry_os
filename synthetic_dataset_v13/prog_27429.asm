; DESCRIPTION: Draws a purple circle centered at (79, 107) with radius 48.
; PLAN: r0=79(x), r1=107(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 107
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
