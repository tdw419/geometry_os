; DESCRIPTION: Draws a green circle centered at (188, 171) with radius 63.
; PLAN: r0=188(x), r1=171(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 171
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
