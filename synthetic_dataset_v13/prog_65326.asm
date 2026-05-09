; DESCRIPTION: Composite: Creates a black circular shape at (336, 106) with radius 41 then Renders a orange line between points (222, 52) and (149, 48) then Creates a yellow rectangular region at (104, 182) spanning 12 by 48 pixels.
; PLAN: r0=336(x), r1=106(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=52(y1), r7=149(x2), r8=48(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=182(y), r12=12(width), r13=48(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 106
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 52
LDI r7, 149
LDI r8, 48
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 182
LDI r12, 12
LDI r13, 48
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
