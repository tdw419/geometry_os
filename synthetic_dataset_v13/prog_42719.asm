; DESCRIPTION: Composite: Sets a single red pixel at (65, 137) then Draws a purple circle centered at (268, 192) with radius 16.
; PLAN: r0=65(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=192(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 65
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 192
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
