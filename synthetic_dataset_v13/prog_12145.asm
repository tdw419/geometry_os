; DESCRIPTION: Draws a green circle centered at (183, 103) with radius 49.
; PLAN: r0=183(x), r1=103(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 103
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
