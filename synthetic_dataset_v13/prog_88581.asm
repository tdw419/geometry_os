; DESCRIPTION: Composite: Draws a purple line from (176, 240) to (461, 122) then Creates a magenta rectangular region at (189, 95) spanning 72 by 92 pixels.
; PLAN: r0=176(x1), r1=240(y1), r2=461(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=95(y), r7=72(width), r8=92(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 240
LDI r2, 461
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 95
LDI r7, 72
LDI r8, 92
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
