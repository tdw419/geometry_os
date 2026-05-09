; DESCRIPTION: Draws a green circle centered at (190, 170) with radius 16.
; PLAN: r0=190(x), r1=170(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 170
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
