; DESCRIPTION: Draws a yellow circle centered at (408, 153) with radius 72.
; PLAN: r0=408(x), r1=153(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 153
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
