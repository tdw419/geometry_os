; DESCRIPTION: Composite: Creates a red rectangular region at (2, 11) spanning 20 by 95 pixels then Draws a white line from (24, 236) to (62, 98).
; PLAN: r0=2(x), r1=11(y), r2=20(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x1), r6=236(y1), r7=62(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 11
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 236
LDI r7, 62
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
