; DESCRIPTION: Composite: Creates a white rectangular region at (103, 118) spanning 83 by 27 pixels then Renders a yellow line between points (34, 161) and (188, 111).
; PLAN: r0=103(x), r1=118(y), r2=83(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=161(y1), r7=188(x2), r8=111(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 118
LDI r2, 83
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 161
LDI r7, 188
LDI r8, 111
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
