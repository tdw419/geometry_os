; DESCRIPTION: Composite: Sets a single blue pixel at (109, 180) then Draws a red circle centered at (406, 179) with radius 66.
; PLAN: r0=109(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=179(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 179
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
