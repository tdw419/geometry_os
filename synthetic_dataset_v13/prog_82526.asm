; DESCRIPTION: Composite: Sets a single cyan pixel at (323, 43) then Renders a black line between points (162, 48) and (230, 178) then Creates a blue rectangular region at (155, 85) spanning 15 by 38 pixels.
; PLAN: r0=323(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=48(y1), r7=230(x2), r8=178(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=85(y), r12=15(width), r13=38(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 48
LDI r7, 230
LDI r8, 178
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 85
LDI r12, 15
LDI r13, 38
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
