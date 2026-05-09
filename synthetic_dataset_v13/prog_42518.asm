; DESCRIPTION: Composite: Creates a black rectangular region at (335, 173) spanning 34 by 47 pixels then Draws a yellow line from (78, 232) to (314, 246).
; PLAN: r0=335(x), r1=173(y), r2=34(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x1), r6=232(y1), r7=314(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 173
LDI r2, 34
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 232
LDI r7, 314
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
