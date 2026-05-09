; DESCRIPTION: Draws a green circle centered at (60, 176) with radius 29.
; PLAN: r0=60(x), r1=176(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 176
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
