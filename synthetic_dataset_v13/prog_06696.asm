; DESCRIPTION: Composite: Creates a yellow rectangular region at (460, 71) spanning 14 by 82 pixels then Renders a cyan line between points (181, 170) and (26, 188) then Creates a yellow circular shape at (379, 174) with radius 68.
; PLAN: r0=460(x), r1=71(y), r2=14(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x1), r6=170(y1), r7=26(x2), r8=188(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=174(y), r12=68(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 71
LDI r2, 14
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 170
LDI r7, 26
LDI r8, 188
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 174
LDI r12, 68
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
