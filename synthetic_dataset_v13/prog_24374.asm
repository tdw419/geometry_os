; DESCRIPTION: Composite: Renders a black line between points (366, 140) and (101, 129) then Draws a cyan circle centered at (78, 138) with radius 71 then Creates a purple rectangular region at (79, 11) spanning 21 by 110 pixels.
; PLAN: r0=366(x1), r1=140(y1), r2=101(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=138(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=11(y), r12=21(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 140
LDI r2, 101
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 138
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 11
LDI r12, 21
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
