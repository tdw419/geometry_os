; DESCRIPTION: Composite: Places a magenta 78x68 rectangle at position (273, 74) then Places a white line segment connecting (34, 144) to (428, 21) then Draws a red circle centered at (423, 137) with radius 79.
; PLAN: r0=273(x), r1=74(y), r2=78(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=144(y1), r7=428(x2), r8=21(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=423(x), r11=137(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 273
LDI r1, 74
LDI r2, 78
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 144
LDI r7, 428
LDI r8, 21
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 137
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
