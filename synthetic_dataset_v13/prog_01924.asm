; DESCRIPTION: Draws a blue circle centered at (260, 66) with radius 48.
; PLAN: r0=260(x), r1=66(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 66
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
