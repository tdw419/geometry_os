; DESCRIPTION: Composite: Draws a black rectangle at (355, 141) with width 89 and height 106 then Sets a single blue pixel at (153, 23).
; PLAN: r0=355(x), r1=141(y), r2=89(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=23(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 141
LDI r2, 89
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 23
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
