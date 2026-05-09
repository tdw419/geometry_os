; DESCRIPTION: Composite: Creates a magenta rectangular region at (166, 232) spanning 10 by 20 pixels then Renders a red line between points (319, 236) and (295, 207).
; PLAN: r0=166(x), r1=232(y), r2=10(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=236(y1), r7=295(x2), r8=207(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 232
LDI r2, 10
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 236
LDI r7, 295
LDI r8, 207
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
