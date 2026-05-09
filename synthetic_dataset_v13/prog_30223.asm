; DESCRIPTION: Composite: Creates a yellow rectangular region at (238, 109) spanning 70 by 97 pixels then Renders a red line between points (502, 229) and (85, 4) then Draws a orange circle centered at (47, 190) with radius 40.
; PLAN: r0=238(x), r1=109(y), r2=70(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=229(y1), r7=85(x2), r8=4(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=190(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 109
LDI r2, 70
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 229
LDI r7, 85
LDI r8, 4
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 190
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
