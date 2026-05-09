; DESCRIPTION: Composite: Renders a magenta disk with center (353, 195) and radius 52 then Creates a cyan rectangular region at (207, 50) spanning 36 by 52 pixels then Renders a orange line between points (390, 241) and (184, 235).
; PLAN: r0=353(x), r1=195(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=50(y), r7=36(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x1), r11=241(y1), r12=184(x2), r13=235(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 195
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 50
LDI r7, 36
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 241
LDI r12, 184
LDI r13, 235
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
