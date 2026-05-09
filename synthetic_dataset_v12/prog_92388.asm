; DESCRIPTION: Composite: Creates a red rectangular region at (115, 98) spanning 117 by 118 pixels then Draws a red line from (168, 247) to (256, 40).
; PLAN: r0=115(x), r1=98(y), r2=117(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x1), r6=247(y1), r7=256(x2), r8=40(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 98
LDI r2, 117
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 247
LDI r7, 256
LDI r8, 40
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
