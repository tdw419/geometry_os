; DESCRIPTION: Draws a purple circle centered at (458, 107) with radius 26.
; PLAN: r0=458(x), r1=107(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 107
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
