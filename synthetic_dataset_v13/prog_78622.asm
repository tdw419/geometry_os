; DESCRIPTION: Composite: Draws a orange line from (433, 51) to (477, 214) then Draws a green circle centered at (395, 152) with radius 62 then Creates a orange rectangular region at (122, 40) spanning 115 by 84 pixels.
; PLAN: r0=433(x1), r1=51(y1), r2=477(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=152(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=40(y), r12=115(width), r13=84(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 51
LDI r2, 477
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 152
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 40
LDI r12, 115
LDI r13, 84
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
