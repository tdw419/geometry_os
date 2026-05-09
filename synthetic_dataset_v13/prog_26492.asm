; DESCRIPTION: Composite: Renders a magenta line between points (58, 213) and (149, 116) then Creates a black rectangular region at (438, 12) spanning 38 by 16 pixels then Creates a yellow circular shape at (238, 202) with radius 10.
; PLAN: r0=58(x1), r1=213(y1), r2=149(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=12(y), r7=38(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=202(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 213
LDI r2, 149
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 12
LDI r7, 38
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 202
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
