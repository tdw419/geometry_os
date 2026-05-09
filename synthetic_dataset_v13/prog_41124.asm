; DESCRIPTION: Composite: Creates a yellow rectangular region at (20, 52) spanning 70 by 86 pixels then Draws a red line from (412, 227) to (258, 189).
; PLAN: r0=20(x), r1=52(y), r2=70(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=227(y1), r7=258(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 52
LDI r2, 70
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 227
LDI r7, 258
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
