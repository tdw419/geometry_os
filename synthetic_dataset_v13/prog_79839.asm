; DESCRIPTION: Draws a blue circle centered at (382, 133) with radius 46.
; PLAN: r0=382(x), r1=133(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 133
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
