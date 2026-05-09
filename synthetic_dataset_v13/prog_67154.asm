; DESCRIPTION: Draws a green circle centered at (178, 153) with radius 40.
; PLAN: r0=178(x), r1=153(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 153
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
