; DESCRIPTION: Draws a green circle centered at (166, 153) with radius 64.
; PLAN: r0=166(x), r1=153(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 153
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
