; DESCRIPTION: Composite: Creates a red rectangular region at (57, 83) spanning 120 by 118 pixels then Places a green line segment connecting (166, 207) to (447, 191).
; PLAN: r0=57(x), r1=83(y), r2=120(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=207(y1), r7=447(x2), r8=191(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 83
LDI r2, 120
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 207
LDI r7, 447
LDI r8, 191
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
