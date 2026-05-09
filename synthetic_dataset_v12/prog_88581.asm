; DESCRIPTION: Draws a purple circle centered at (307, 204) with radius 36.
; PLAN: r0=307(x), r1=204(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 204
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
