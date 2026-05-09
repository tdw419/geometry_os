; DESCRIPTION: Composite: Draws a black line from (316, 109) to (344, 182) then Renders a white box of size 21x56 starting at (179, 79).
; PLAN: r0=316(x1), r1=109(y1), r2=344(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=79(y), r7=21(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 109
LDI r2, 344
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 79
LDI r7, 21
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
