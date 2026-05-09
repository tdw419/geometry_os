; DESCRIPTION: Composite: Creates a red rectangular region at (12, 59) spanning 72 by 120 pixels then Draws a red line from (119, 126) to (321, 79).
; PLAN: r0=12(x), r1=59(y), r2=72(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=126(y1), r7=321(x2), r8=79(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 59
LDI r2, 72
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 126
LDI r7, 321
LDI r8, 79
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
