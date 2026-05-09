; DESCRIPTION: Composite: Draws a red line from (93, 182) to (181, 63) then Places a cyan circle of radius 33 at center (296, 71) then Creates a orange rectangular region at (170, 23) spanning 109 by 15 pixels.
; PLAN: r0=93(x1), r1=182(y1), r2=181(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=71(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=23(y), r12=109(width), r13=15(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 182
LDI r2, 181
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 71
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 23
LDI r12, 109
LDI r13, 15
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
