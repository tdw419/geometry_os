; DESCRIPTION: Composite: Draws a white circle centered at (354, 147) with radius 79 then Draws a purple rectangle at (94, 52) with width 57 and height 102 then Places a red line segment connecting (393, 50) to (430, 99).
; PLAN: r0=354(x), r1=147(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=52(y), r7=57(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x1), r11=50(y1), r12=430(x2), r13=99(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 147
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 52
LDI r7, 57
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 50
LDI r12, 430
LDI r13, 99
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
