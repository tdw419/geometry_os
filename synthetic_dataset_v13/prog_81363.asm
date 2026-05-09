; DESCRIPTION: Draws a blue circle centered at (368, 172) with radius 68.
; PLAN: r0=368(x), r1=172(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 172
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
