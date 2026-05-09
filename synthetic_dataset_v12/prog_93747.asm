; DESCRIPTION: Draws a purple circle centered at (473, 107) with radius 23.
; PLAN: r0=473(x), r1=107(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 107
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
