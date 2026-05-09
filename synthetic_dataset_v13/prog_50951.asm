; DESCRIPTION: Composite: Sets a single black pixel at (364, 148) then Draws a orange line from (49, 230) to (500, 7) then Creates a green rectangular region at (146, 132) spanning 80 by 94 pixels.
; PLAN: r0=364(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=230(y1), r7=500(x2), r8=7(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=132(y), r12=80(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 49
LDI r6, 230
LDI r7, 500
LDI r8, 7
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 132
LDI r12, 80
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
