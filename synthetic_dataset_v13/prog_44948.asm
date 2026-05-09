; DESCRIPTION: Draws a green circle centered at (260, 134) with radius 59.
; PLAN: r0=260(x), r1=134(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 134
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
