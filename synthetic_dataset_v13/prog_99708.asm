; DESCRIPTION: Composite: Creates a yellow rectangular region at (240, 75) spanning 99 by 70 pixels then Places a red line segment connecting (378, 230) to (429, 196) then Creates a green circular shape at (458, 106) with radius 54.
; PLAN: r0=240(x), r1=75(y), r2=99(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x1), r6=230(y1), r7=429(x2), r8=196(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=106(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 75
LDI r2, 99
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 230
LDI r7, 429
LDI r8, 196
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 106
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
