; DESCRIPTION: Composite: Sets a single blue pixel at (511, 160) then Draws a cyan rectangle at (311, 60) with width 22 and height 93 then Creates a cyan circular shape at (378, 218) with radius 24.
; PLAN: r0=511(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=60(y), r7=22(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=218(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 511
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 60
LDI r7, 22
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 218
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
