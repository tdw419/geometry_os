; DESCRIPTION: Draws a green circle centered at (417, 186) with radius 62.
; PLAN: r0=417(x), r1=186(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 186
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
