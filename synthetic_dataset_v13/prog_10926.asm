; DESCRIPTION: Draws a green circle centered at (270, 131) with radius 73.
; PLAN: r0=270(x), r1=131(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 131
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
