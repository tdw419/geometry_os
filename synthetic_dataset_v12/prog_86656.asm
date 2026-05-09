; DESCRIPTION: Composite: Draws a green circle centered at (423, 156) with radius 51 then Draws a green rectangle at (300, 94) with width 63 and height 52.
; PLAN: r0=423(x), r1=156(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=94(y), r7=63(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 156
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 94
LDI r7, 63
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
