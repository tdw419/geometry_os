; DESCRIPTION: Composite: Renders a magenta line between points (47, 38) and (17, 213) then Creates a red rectangular region at (169, 26) spanning 87 by 14 pixels then Creates a yellow circular shape at (55, 146) with radius 34.
; PLAN: r0=47(x1), r1=38(y1), r2=17(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=26(y), r7=87(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=146(y), r12=34(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 38
LDI r2, 17
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 26
LDI r7, 87
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 146
LDI r12, 34
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
