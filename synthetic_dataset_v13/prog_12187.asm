; DESCRIPTION: Draws a yellow circle centered at (73, 103) with radius 47.
; PLAN: r0=73(x), r1=103(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 103
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
