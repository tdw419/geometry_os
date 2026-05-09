; DESCRIPTION: Draws a blue circle centered at (100, 186) with radius 28.
; PLAN: r0=100(x), r1=186(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 186
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
