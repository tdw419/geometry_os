; DESCRIPTION: Composite: Creates a red rectangular region at (148, 141) spanning 41 by 18 pixels then Sets a single yellow pixel at (28, 206) then Draws a orange line from (306, 84) to (317, 187).
; PLAN: r0=148(x), r1=141(y), r2=41(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x), r6=206(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=306(x1), r11=84(y1), r12=317(x2), r13=187(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 141
LDI r2, 41
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 206
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 306
LDI r11, 84
LDI r12, 317
LDI r13, 187
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
