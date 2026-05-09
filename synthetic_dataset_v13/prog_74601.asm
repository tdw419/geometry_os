; DESCRIPTION: Composite: Creates a red rectangular region at (212, 91) spanning 105 by 117 pixels then Renders a green line between points (339, 80) and (510, 184).
; PLAN: r0=212(x), r1=91(y), r2=105(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x1), r6=80(y1), r7=510(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 91
LDI r2, 105
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 80
LDI r7, 510
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
