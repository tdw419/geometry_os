; DESCRIPTION: Composite: Draws a red line from (408, 134) to (120, 173) then Draws a green rectangle at (340, 147) with width 78 and height 98 then Creates a black circular shape at (399, 213) with radius 31.
; PLAN: r0=408(x1), r1=134(y1), r2=120(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=147(y), r7=78(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=213(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 134
LDI r2, 120
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 147
LDI r7, 78
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 213
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
