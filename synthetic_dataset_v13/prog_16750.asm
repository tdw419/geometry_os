; DESCRIPTION: Draws a blue circle centered at (177, 208) with radius 21.
; PLAN: r0=177(x), r1=208(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 208
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
