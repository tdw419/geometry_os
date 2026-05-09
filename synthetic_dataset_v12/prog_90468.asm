; DESCRIPTION: Draws a purple circle centered at (196, 153) with radius 55.
; PLAN: r0=196(x), r1=153(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 153
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
