; DESCRIPTION: Composite: Creates a yellow circular shape at (378, 170) with radius 51 then Draws a green rectangle at (176, 225) with width 52 and height 26.
; PLAN: r0=378(x), r1=170(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=225(y), r7=52(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 170
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 225
LDI r7, 52
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
