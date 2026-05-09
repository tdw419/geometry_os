; DESCRIPTION: Draws a green circle centered at (166, 174) with radius 10.
; PLAN: r0=166(x), r1=174(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 174
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
