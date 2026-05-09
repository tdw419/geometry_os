; DESCRIPTION: Draws a yellow circle centered at (408, 225) with radius 10.
; PLAN: r0=408(x), r1=225(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 225
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
