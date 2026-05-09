; DESCRIPTION: Composite: Creates a blue circular shape at (451, 94) with radius 44 then Sets a single red pixel at (118, 174) then Draws a green rectangle at (302, 72) with width 11 and height 75.
; PLAN: r0=451(x), r1=94(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=174(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=72(y), r12=11(width), r13=75(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 94
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 174
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 302
LDI r11, 72
LDI r12, 11
LDI r13, 75
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
