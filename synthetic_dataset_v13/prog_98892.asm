; DESCRIPTION: Composite: Draws a cyan circle centered at (296, 147) with radius 80 then Creates a red rectangular region at (490, 117) spanning 17 by 22 pixels.
; PLAN: r0=296(x), r1=147(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=117(y), r7=17(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 147
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 117
LDI r7, 17
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
