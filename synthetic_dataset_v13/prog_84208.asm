; DESCRIPTION: Draws a yellow circle centered at (309, 153) with radius 80.
; PLAN: r0=309(x), r1=153(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 153
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
