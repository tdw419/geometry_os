; DESCRIPTION: Composite: Draws a blue line from (98, 122) to (336, 89) then Renders a cyan box of size 107x36 starting at (225, 209) then Draws a orange circle centered at (375, 34) with radius 23.
; PLAN: r0=98(x1), r1=122(y1), r2=336(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=209(y), r7=107(width), r8=36(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=34(y), r12=23(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 122
LDI r2, 336
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 209
LDI r7, 107
LDI r8, 36
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 34
LDI r12, 23
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
