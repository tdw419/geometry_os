; DESCRIPTION: Composite: Draws a yellow line from (123, 201) to (102, 212) then Draws a orange rectangle at (79, 126) with width 40 and height 41 then Creates a red circular shape at (89, 186) with radius 24.
; PLAN: r0=123(x1), r1=201(y1), r2=102(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=126(y), r7=40(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x), r11=186(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 123
LDI r1, 201
LDI r2, 102
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 126
LDI r7, 40
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 186
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
