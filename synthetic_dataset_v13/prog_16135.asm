; DESCRIPTION: Composite: Creates a magenta rectangular region at (406, 100) spanning 88 by 41 pixels then Renders a green line between points (323, 166) and (19, 234).
; PLAN: r0=406(x), r1=100(y), r2=88(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x1), r6=166(y1), r7=19(x2), r8=234(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 100
LDI r2, 88
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 166
LDI r7, 19
LDI r8, 234
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
