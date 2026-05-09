; DESCRIPTION: Composite: Places a green line segment connecting (264, 166) to (201, 150) then Creates a white rectangular region at (316, 85) spanning 101 by 101 pixels.
; PLAN: r0=264(x1), r1=166(y1), r2=201(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=85(y), r7=101(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 166
LDI r2, 201
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 85
LDI r7, 101
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
