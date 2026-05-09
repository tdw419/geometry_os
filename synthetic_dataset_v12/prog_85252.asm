; DESCRIPTION: Draws a purple circle centered at (162, 174) with radius 80.
; PLAN: r0=162(x), r1=174(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 174
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
