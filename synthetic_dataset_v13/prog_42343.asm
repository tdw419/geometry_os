; DESCRIPTION: Draws a purple circle centered at (166, 108) with radius 57.
; PLAN: r0=166(x), r1=108(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 108
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
