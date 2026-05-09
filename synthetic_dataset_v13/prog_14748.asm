; DESCRIPTION: Composite: Draws a red rectangle at (47, 21) with width 70 and height 98 then Draws a yellow line from (235, 136) to (366, 205) then Places a orange circle of radius 25 at center (441, 86).
; PLAN: r0=47(x), r1=21(y), r2=70(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=136(y1), r7=366(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=86(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 21
LDI r2, 70
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 136
LDI r7, 366
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 86
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
