; DESCRIPTION: Draws a yellow circle centered at (61, 151) with radius 49.
; PLAN: r0=61(x), r1=151(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 151
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
