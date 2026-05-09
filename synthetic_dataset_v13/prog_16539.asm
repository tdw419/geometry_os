; DESCRIPTION: Composite: Sets a single purple pixel at (172, 10) then Draws a green line from (411, 252) to (22, 155) then Draws a blue rectangle at (334, 82) with width 96 and height 85.
; PLAN: r0=172(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=252(y1), r7=22(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=82(y), r12=96(width), r13=85(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 252
LDI r7, 22
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 82
LDI r12, 96
LDI r13, 85
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
