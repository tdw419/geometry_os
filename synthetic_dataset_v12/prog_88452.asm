; DESCRIPTION: Composite: Creates a black rectangular region at (357, 161) spanning 28 by 14 pixels then Draws a orange circle centered at (229, 92) with radius 46 then Renders a yellow line between points (488, 19) and (77, 121).
; PLAN: r0=357(x), r1=161(y), r2=28(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=92(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=488(x1), r11=19(y1), r12=77(x2), r13=121(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 161
LDI r2, 28
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 92
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 488
LDI r11, 19
LDI r12, 77
LDI r13, 121
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
