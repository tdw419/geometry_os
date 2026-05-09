; DESCRIPTION: Draws a blue circle centered at (126, 69) with radius 50.
; PLAN: r0=126(x), r1=69(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 69
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
