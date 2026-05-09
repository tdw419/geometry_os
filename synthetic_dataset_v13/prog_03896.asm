; DESCRIPTION: Composite: Creates a red rectangular region at (120, 117) spanning 45 by 29 pixels then Draws a red line from (172, 21) to (344, 228) then Draws a red circle centered at (316, 77) with radius 45.
; PLAN: r0=120(x), r1=117(y), r2=45(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=21(y1), r7=344(x2), r8=228(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=77(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 117
LDI r2, 45
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 21
LDI r7, 344
LDI r8, 228
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 77
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
