; DESCRIPTION: Draws a green circle centered at (199, 145) with radius 67.
; PLAN: r0=199(x), r1=145(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 145
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
