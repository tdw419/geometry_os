; DESCRIPTION: Composite: Creates a white rectangular region at (149, 87) spanning 117 by 117 pixels then Draws a red line from (137, 11) to (34, 26) then Creates a cyan circular shape at (342, 164) with radius 72.
; PLAN: r0=149(x), r1=87(y), r2=117(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=11(y1), r7=34(x2), r8=26(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=164(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 87
LDI r2, 117
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 11
LDI r7, 34
LDI r8, 26
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 164
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
