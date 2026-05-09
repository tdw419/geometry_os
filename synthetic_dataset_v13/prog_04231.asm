; DESCRIPTION: Draws a green circle centered at (183, 160) with radius 65.
; PLAN: r0=183(x), r1=160(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 160
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
