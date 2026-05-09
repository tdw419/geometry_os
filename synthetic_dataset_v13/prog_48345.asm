; DESCRIPTION: Draws a blue circle centered at (342, 31) with radius 21.
; PLAN: r0=342(x), r1=31(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 31
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
