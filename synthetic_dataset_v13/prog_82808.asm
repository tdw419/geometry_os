; DESCRIPTION: Draws a blue circle centered at (360, 162) with radius 50.
; PLAN: r0=360(x), r1=162(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 162
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
