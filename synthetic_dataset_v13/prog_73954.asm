; DESCRIPTION: Composite: Creates a yellow rectangular region at (301, 133) spanning 22 by 110 pixels then Draws a green line from (474, 238) to (484, 90).
; PLAN: r0=301(x), r1=133(y), r2=22(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=238(y1), r7=484(x2), r8=90(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 133
LDI r2, 22
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 238
LDI r7, 484
LDI r8, 90
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
