; DESCRIPTION: Composite: Creates a orange rectangular region at (263, 47) spanning 75 by 106 pixels then Renders a orange line between points (226, 97) and (44, 233) then Renders a red disk with center (358, 78) and radius 31.
; PLAN: r0=263(x), r1=47(y), r2=75(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x1), r6=97(y1), r7=44(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=78(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 47
LDI r2, 75
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 97
LDI r7, 44
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 78
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
