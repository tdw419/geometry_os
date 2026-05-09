; DESCRIPTION: Composite: Creates a magenta rectangular region at (130, 81) spanning 57 by 102 pixels then Draws a red line from (45, 56) to (296, 112).
; PLAN: r0=130(x), r1=81(y), r2=57(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=56(y1), r7=296(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 81
LDI r2, 57
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 56
LDI r7, 296
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
