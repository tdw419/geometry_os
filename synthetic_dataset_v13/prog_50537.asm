; DESCRIPTION: Draws a red circle centered at (162, 136) with radius 58.
; PLAN: r0=162(x), r1=136(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 136
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
