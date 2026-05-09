; DESCRIPTION: Composite: Creates a orange rectangular region at (41, 173) spanning 98 by 21 pixels then Draws a cyan circle centered at (156, 105) with radius 80 then Renders a purple line between points (155, 2) and (262, 208).
; PLAN: r0=41(x), r1=173(y), r2=98(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=105(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x1), r11=2(y1), r12=262(x2), r13=208(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 173
LDI r2, 98
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 105
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 2
LDI r12, 262
LDI r13, 208
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
