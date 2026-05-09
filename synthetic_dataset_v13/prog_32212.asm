; DESCRIPTION: Composite: Creates a yellow circular shape at (458, 159) with radius 49 then Draws a cyan line from (146, 34) to (105, 11) then Creates a yellow rectangular region at (187, 65) spanning 116 by 117 pixels.
; PLAN: r0=458(x), r1=159(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=34(y1), r7=105(x2), r8=11(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=65(y), r12=116(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 159
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 34
LDI r7, 105
LDI r8, 11
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 65
LDI r12, 116
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
