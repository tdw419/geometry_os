; DESCRIPTION: Composite: Draws a cyan line from (21, 133) to (357, 101) then Creates a blue rectangular region at (235, 85) spanning 112 by 61 pixels.
; PLAN: r0=21(x1), r1=133(y1), r2=357(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=85(y), r7=112(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 133
LDI r2, 357
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 85
LDI r7, 112
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
