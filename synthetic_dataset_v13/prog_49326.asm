; DESCRIPTION: Draws a blue circle centered at (216, 186) with radius 26.
; PLAN: r0=216(x), r1=186(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 186
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
