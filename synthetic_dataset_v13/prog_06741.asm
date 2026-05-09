; DESCRIPTION: Draws a purple circle centered at (354, 152) with radius 40.
; PLAN: r0=354(x), r1=152(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 152
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
