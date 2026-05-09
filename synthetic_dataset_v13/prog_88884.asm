; DESCRIPTION: Draws a green circle centered at (94, 186) with radius 20.
; PLAN: r0=94(x), r1=186(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 186
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
