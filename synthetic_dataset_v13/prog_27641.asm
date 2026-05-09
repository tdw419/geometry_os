; DESCRIPTION: Composite: Creates a orange rectangular region at (2, 65) spanning 102 by 117 pixels then Renders a white line between points (93, 102) and (383, 140).
; PLAN: r0=2(x), r1=65(y), r2=102(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x1), r6=102(y1), r7=383(x2), r8=140(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 65
LDI r2, 102
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 102
LDI r7, 383
LDI r8, 140
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
