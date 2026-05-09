; DESCRIPTION: Composite: Creates a red rectangular region at (36, 36) spanning 94 by 31 pixels then Draws a white line from (366, 66) to (78, 112).
; PLAN: r0=36(x), r1=36(y), r2=94(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x1), r6=66(y1), r7=78(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 36
LDI r2, 94
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 66
LDI r7, 78
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
