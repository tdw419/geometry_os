; DESCRIPTION: Composite: Draws a green circle centered at (47, 22) with radius 21 then Draws a yellow rectangle at (43, 89) with width 78 and height 113.
; PLAN: r0=47(x), r1=22(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=89(y), r7=78(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 22
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 89
LDI r7, 78
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
