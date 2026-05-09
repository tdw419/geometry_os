; DESCRIPTION: Composite: Draws a cyan line from (234, 47) to (475, 6) then Creates a blue rectangular region at (129, 118) spanning 78 by 19 pixels then Creates a red circular shape at (267, 139) with radius 38.
; PLAN: r0=234(x1), r1=47(y1), r2=475(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=118(y), r7=78(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=139(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 47
LDI r2, 475
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 118
LDI r7, 78
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 139
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
