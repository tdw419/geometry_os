; DESCRIPTION: Composite: Creates a blue rectangular region at (302, 218) spanning 25 by 15 pixels then Renders a cyan line between points (429, 162) and (17, 212).
; PLAN: r0=302(x), r1=218(y), r2=25(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=162(y1), r7=17(x2), r8=212(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 218
LDI r2, 25
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 162
LDI r7, 17
LDI r8, 212
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
