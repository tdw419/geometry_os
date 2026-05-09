; DESCRIPTION: Composite: Places a purple line segment connecting (189, 207) to (499, 201) then Creates a red rectangular region at (16, 26) spanning 78 by 41 pixels.
; PLAN: r0=189(x1), r1=207(y1), r2=499(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=26(y), r7=78(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 207
LDI r2, 499
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 26
LDI r7, 78
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
