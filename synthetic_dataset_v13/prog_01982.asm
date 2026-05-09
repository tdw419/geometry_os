; DESCRIPTION: Draws a blue circle centered at (100, 167) with radius 50.
; PLAN: r0=100(x), r1=167(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 167
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
