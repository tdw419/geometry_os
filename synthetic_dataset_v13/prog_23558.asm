; DESCRIPTION: Composite: Renders a magenta box of size 54x57 starting at (91, 24) then Places a purple line segment connecting (347, 0) to (465, 80) then Places a red circle of radius 24 at center (302, 178).
; PLAN: r0=91(x), r1=24(y), r2=54(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=0(y1), r7=465(x2), r8=80(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=178(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 24
LDI r2, 54
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 0
LDI r7, 465
LDI r8, 80
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 178
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
