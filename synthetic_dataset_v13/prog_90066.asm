; DESCRIPTION: Draws a green circle centered at (163, 177) with radius 24.
; PLAN: r0=163(x), r1=177(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 177
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
