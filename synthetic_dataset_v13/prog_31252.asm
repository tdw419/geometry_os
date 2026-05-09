; DESCRIPTION: Composite: Places a yellow line segment connecting (177, 86) to (430, 22) then Creates a red rectangular region at (9, 102) spanning 110 by 10 pixels.
; PLAN: r0=177(x1), r1=86(y1), r2=430(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=102(y), r7=110(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 86
LDI r2, 430
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 102
LDI r7, 110
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
