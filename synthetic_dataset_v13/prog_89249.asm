; DESCRIPTION: Draws a green circle centered at (413, 97) with radius 48.
; PLAN: r0=413(x), r1=97(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 97
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
