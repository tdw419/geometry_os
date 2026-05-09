; DESCRIPTION: Composite: Creates a red circular shape at (326, 166) with radius 54 then Creates a purple rectangular region at (50, 10) spanning 62 by 39 pixels then Places a blue line segment connecting (276, 178) to (94, 91).
; PLAN: r0=326(x), r1=166(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=10(y), r7=62(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x1), r11=178(y1), r12=94(x2), r13=91(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 166
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 10
LDI r7, 62
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 178
LDI r12, 94
LDI r13, 91
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
