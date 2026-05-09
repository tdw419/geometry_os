; DESCRIPTION: Composite: Creates a magenta rectangular region at (406, 38) spanning 65 by 35 pixels then Renders a yellow line between points (232, 13) and (208, 145).
; PLAN: r0=406(x), r1=38(y), r2=65(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=13(y1), r7=208(x2), r8=145(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 38
LDI r2, 65
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 13
LDI r7, 208
LDI r8, 145
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
