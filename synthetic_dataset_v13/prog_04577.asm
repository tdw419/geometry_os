; DESCRIPTION: Composite: Sets a single blue pixel at (411, 175) then Draws a green circle centered at (259, 52) with radius 19.
; PLAN: r0=411(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=52(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 52
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
