; DESCRIPTION: Composite: Creates a magenta rectangular region at (21, 108) spanning 77 by 105 pixels then Places a purple line segment connecting (287, 80) to (281, 117).
; PLAN: r0=21(x), r1=108(y), r2=77(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=80(y1), r7=281(x2), r8=117(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 108
LDI r2, 77
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 80
LDI r7, 281
LDI r8, 117
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
