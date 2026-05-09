; DESCRIPTION: Composite: Renders a green line between points (408, 115) and (337, 254) then Renders a blue box of size 78x42 starting at (157, 39) then Renders a orange disk with center (276, 158) and radius 58.
; PLAN: r0=408(x1), r1=115(y1), r2=337(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=39(y), r7=78(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=158(y), r12=58(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 115
LDI r2, 337
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 39
LDI r7, 78
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 158
LDI r12, 58
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
