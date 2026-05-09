; DESCRIPTION: Draws a green circle centered at (411, 174) with radius 80.
; PLAN: r0=411(x), r1=174(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 174
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
