; DESCRIPTION: Composite: Places a magenta line segment connecting (308, 205) to (266, 13) then Creates a purple rectangular region at (352, 78) spanning 44 by 25 pixels then Places a yellow circle of radius 15 at center (452, 167).
; PLAN: r0=308(x1), r1=205(y1), r2=266(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=78(y), r7=44(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=167(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 205
LDI r2, 266
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 78
LDI r7, 44
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 167
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
