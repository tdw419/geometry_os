; DESCRIPTION: Draws a blue circle centered at (428, 208) with radius 16.
; PLAN: r0=428(x), r1=208(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 208
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
