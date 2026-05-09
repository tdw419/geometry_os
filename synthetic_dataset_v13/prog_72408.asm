; DESCRIPTION: Composite: Creates a magenta rectangular region at (111, 38) spanning 85 by 92 pixels then Draws a magenta line from (297, 235) to (409, 33).
; PLAN: r0=111(x), r1=38(y), r2=85(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=235(y1), r7=409(x2), r8=33(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 38
LDI r2, 85
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 235
LDI r7, 409
LDI r8, 33
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
