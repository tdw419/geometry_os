; DESCRIPTION: Composite: Creates a blue rectangular region at (13, 110) spanning 107 by 27 pixels then Renders a red line between points (347, 218) and (70, 230).
; PLAN: r0=13(x), r1=110(y), r2=107(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=218(y1), r7=70(x2), r8=230(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 110
LDI r2, 107
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 218
LDI r7, 70
LDI r8, 230
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
