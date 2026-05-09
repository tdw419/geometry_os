; DESCRIPTION: Composite: Creates a yellow rectangular region at (489, 166) spanning 20 by 90 pixels then Draws a green line from (352, 176) to (68, 240) then Creates a green circular shape at (53, 207) with radius 31.
; PLAN: r0=489(x), r1=166(y), r2=20(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=176(y1), r7=68(x2), r8=240(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=207(y), r12=31(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 166
LDI r2, 20
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 176
LDI r7, 68
LDI r8, 240
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 207
LDI r12, 31
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
