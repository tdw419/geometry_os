; DESCRIPTION: Draws a purple circle centered at (304, 176) with radius 46.
; PLAN: r0=304(x), r1=176(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 176
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
