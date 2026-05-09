; DESCRIPTION: Draws a blue circle centered at (101, 114) with radius 48.
; PLAN: r0=101(x), r1=114(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 114
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
