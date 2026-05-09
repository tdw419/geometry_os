; DESCRIPTION: Composite: Places a red dot at position (248, 226) then Draws a blue circle centered at (94, 140) with radius 31.
; PLAN: r0=248(x), r1=226(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=140(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 226
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 140
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
