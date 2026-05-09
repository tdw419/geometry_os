; DESCRIPTION: Composite: Creates a white rectangular region at (400, 9) spanning 85 by 62 pixels then Renders a green line between points (236, 138) and (373, 160).
; PLAN: r0=400(x), r1=9(y), r2=85(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=138(y1), r7=373(x2), r8=160(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 9
LDI r2, 85
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 138
LDI r7, 373
LDI r8, 160
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
