; DESCRIPTION: Composite: Places a purple line segment connecting (360, 43) to (175, 241) then Sets a single red pixel at (507, 102) then Draws a cyan rectangle at (355, 179) with width 41 and height 59.
; PLAN: r0=360(x1), r1=43(y1), r2=175(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=507(x), r6=102(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=179(y), r12=41(width), r13=59(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 43
LDI r2, 175
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 102
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 355
LDI r11, 179
LDI r12, 41
LDI r13, 59
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
