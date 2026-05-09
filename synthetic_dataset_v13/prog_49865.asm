; DESCRIPTION: Composite: Creates a black rectangular region at (161, 36) spanning 40 by 108 pixels then Draws a red line from (104, 25) to (404, 242) then Draws a magenta circle centered at (306, 110) with radius 31.
; PLAN: r0=161(x), r1=36(y), r2=40(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x1), r6=25(y1), r7=404(x2), r8=242(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=110(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 36
LDI r2, 40
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 25
LDI r7, 404
LDI r8, 242
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 110
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
