; DESCRIPTION: Composite: Creates a cyan rectangular region at (366, 4) spanning 24 by 18 pixels then Creates a purple circular shape at (277, 135) with radius 41 then Renders a black line between points (204, 205) and (86, 81).
; PLAN: r0=366(x), r1=4(y), r2=24(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=135(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=205(y1), r12=86(x2), r13=81(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 4
LDI r2, 24
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 135
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 205
LDI r12, 86
LDI r13, 81
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
