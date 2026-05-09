; DESCRIPTION: Composite: Sets a single blue pixel at (505, 102) then Draws a red circle centered at (284, 97) with radius 34.
; PLAN: r0=505(x), r1=102(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=97(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 102
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 97
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
