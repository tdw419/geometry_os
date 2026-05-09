; DESCRIPTION: Composite: Sets a single yellow pixel at (406, 179) then Draws a purple circle centered at (275, 84) with radius 39.
; PLAN: r0=406(x), r1=179(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=84(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 179
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 84
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
