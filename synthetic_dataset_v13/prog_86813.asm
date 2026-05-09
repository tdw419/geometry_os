; DESCRIPTION: Draws a yellow circle centered at (464, 153) with radius 10.
; PLAN: r0=464(x), r1=153(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 153
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
