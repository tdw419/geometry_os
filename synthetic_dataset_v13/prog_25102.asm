; DESCRIPTION: Draws a cyan circle centered at (323, 155) with radius 20.
; PLAN: r0=323(x), r1=155(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 155
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
