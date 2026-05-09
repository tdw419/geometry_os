; DESCRIPTION: Composite: Creates a magenta rectangular region at (243, 54) spanning 55 by 108 pixels then Draws a yellow line from (80, 82) to (353, 43).
; PLAN: r0=243(x), r1=54(y), r2=55(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=82(y1), r7=353(x2), r8=43(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 54
LDI r2, 55
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 82
LDI r7, 353
LDI r8, 43
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
