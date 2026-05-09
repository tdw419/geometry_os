; DESCRIPTION: Composite: Creates a yellow rectangular region at (170, 183) spanning 20 by 43 pixels then Draws a red circle centered at (361, 106) with radius 47 then Draws a orange line from (161, 57) to (324, 98).
; PLAN: r0=170(x), r1=183(y), r2=20(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=106(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x1), r11=57(y1), r12=324(x2), r13=98(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 183
LDI r2, 20
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 106
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 57
LDI r12, 324
LDI r13, 98
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
