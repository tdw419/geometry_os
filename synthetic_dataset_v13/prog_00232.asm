; DESCRIPTION: Composite: Draws a black line from (339, 184) to (16, 26) then Creates a orange circular shape at (91, 148) with radius 29 then Creates a orange rectangular region at (388, 60) spanning 117 by 91 pixels.
; PLAN: r0=339(x1), r1=184(y1), r2=16(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=148(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=60(y), r12=117(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 184
LDI r2, 16
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 148
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 60
LDI r12, 117
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
