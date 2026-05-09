; DESCRIPTION: Draws a purple circle centered at (393, 59) with radius 22.
; PLAN: r0=393(x), r1=59(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 59
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
