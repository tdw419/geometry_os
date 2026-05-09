; DESCRIPTION: Composite: Creates a cyan rectangular region at (297, 186) spanning 34 by 70 pixels then Places a black line segment connecting (460, 79) to (316, 188).
; PLAN: r0=297(x), r1=186(y), r2=34(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x1), r6=79(y1), r7=316(x2), r8=188(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 186
LDI r2, 34
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 79
LDI r7, 316
LDI r8, 188
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
