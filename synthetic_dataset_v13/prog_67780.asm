; DESCRIPTION: Composite: Draws a red line from (424, 142) to (108, 141) then Draws a orange circle centered at (31, 110) with radius 28 then Renders a white box of size 24x11 starting at (486, 101).
; PLAN: r0=424(x1), r1=142(y1), r2=108(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=110(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=101(y), r12=24(width), r13=11(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 142
LDI r2, 108
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 110
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 101
LDI r12, 24
LDI r13, 11
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
