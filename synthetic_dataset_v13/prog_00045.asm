; DESCRIPTION: Composite: Creates a orange rectangular region at (342, 217) spanning 82 by 38 pixels then Places a purple line segment connecting (37, 211) to (319, 27).
; PLAN: r0=342(x), r1=217(y), r2=82(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=211(y1), r7=319(x2), r8=27(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 217
LDI r2, 82
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 211
LDI r7, 319
LDI r8, 27
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
