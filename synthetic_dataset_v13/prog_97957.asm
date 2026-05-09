; DESCRIPTION: Composite: Creates a yellow rectangular region at (67, 6) spanning 57 by 102 pixels then Places a yellow line segment connecting (232, 193) to (444, 191).
; PLAN: r0=67(x), r1=6(y), r2=57(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=193(y1), r7=444(x2), r8=191(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 6
LDI r2, 57
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 193
LDI r7, 444
LDI r8, 191
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
