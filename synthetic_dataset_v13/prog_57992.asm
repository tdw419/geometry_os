; DESCRIPTION: Composite: Creates a blue rectangular region at (349, 76) spanning 98 by 15 pixels then Draws a magenta line from (190, 235) to (363, 148).
; PLAN: r0=349(x), r1=76(y), r2=98(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x1), r6=235(y1), r7=363(x2), r8=148(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 76
LDI r2, 98
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 235
LDI r7, 363
LDI r8, 148
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
