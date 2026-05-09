; DESCRIPTION: Composite: Creates a magenta rectangular region at (103, 160) spanning 61 by 14 pixels then Draws a white line from (66, 104) to (11, 245).
; PLAN: r0=103(x), r1=160(y), r2=61(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x1), r6=104(y1), r7=11(x2), r8=245(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 160
LDI r2, 61
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 104
LDI r7, 11
LDI r8, 245
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
