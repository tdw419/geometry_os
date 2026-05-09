; DESCRIPTION: Composite: Creates a cyan rectangular region at (466, 41) spanning 39 by 101 pixels then Draws a yellow line from (201, 25) to (199, 178) then Creates a green circular shape at (235, 212) with radius 44.
; PLAN: r0=466(x), r1=41(y), r2=39(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=25(y1), r7=199(x2), r8=178(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=212(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 41
LDI r2, 39
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 25
LDI r7, 199
LDI r8, 178
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 212
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
