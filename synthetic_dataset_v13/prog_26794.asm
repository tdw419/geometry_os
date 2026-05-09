; DESCRIPTION: Composite: Places a purple circle of radius 17 at center (149, 182) then Renders a orange line between points (181, 255) and (116, 135) then Renders a purple box of size 109x24 starting at (23, 46).
; PLAN: r0=149(x), r1=182(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=255(y1), r7=116(x2), r8=135(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=46(y), r12=109(width), r13=24(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 182
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 255
LDI r7, 116
LDI r8, 135
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 46
LDI r12, 109
LDI r13, 24
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
