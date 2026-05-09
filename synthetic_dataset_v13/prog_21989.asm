; DESCRIPTION: Composite: Creates a orange rectangular region at (444, 113) spanning 24 by 53 pixels then Places a white dot at position (58, 141) then Draws a orange line from (414, 162) to (282, 169).
; PLAN: r0=444(x), r1=113(y), r2=24(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=141(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=414(x1), r11=162(y1), r12=282(x2), r13=169(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 113
LDI r2, 24
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 141
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 162
LDI r12, 282
LDI r13, 169
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
