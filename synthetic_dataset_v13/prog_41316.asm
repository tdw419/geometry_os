; DESCRIPTION: Composite: Draws a red line from (161, 234) to (24, 198) then Creates a cyan rectangular region at (71, 51) spanning 43 by 47 pixels then Creates a yellow circular shape at (135, 80) with radius 56.
; PLAN: r0=161(x1), r1=234(y1), r2=24(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=51(y), r7=43(width), r8=47(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=80(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 234
LDI r2, 24
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 51
LDI r7, 43
LDI r8, 47
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 80
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
