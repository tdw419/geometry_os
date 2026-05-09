; DESCRIPTION: Composite: Creates a white rectangular region at (28, 120) spanning 76 by 118 pixels then Renders a red line between points (278, 197) and (14, 130).
; PLAN: r0=28(x), r1=120(y), r2=76(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=197(y1), r7=14(x2), r8=130(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 120
LDI r2, 76
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 197
LDI r7, 14
LDI r8, 130
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
