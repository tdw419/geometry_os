; DESCRIPTION: Composite: Creates a yellow rectangular region at (221, 177) spanning 10 by 26 pixels then Places a blue line segment connecting (3, 60) to (246, 3) then Creates a white circular shape at (189, 117) with radius 56.
; PLAN: r0=221(x), r1=177(y), r2=10(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x1), r6=60(y1), r7=246(x2), r8=3(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=117(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 177
LDI r2, 10
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 60
LDI r7, 246
LDI r8, 3
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 117
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
