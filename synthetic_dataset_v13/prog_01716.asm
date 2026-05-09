; DESCRIPTION: Composite: Renders a black line between points (51, 210) and (225, 165) then Creates a orange rectangular region at (202, 22) spanning 45 by 111 pixels then Creates a black circular shape at (85, 132) with radius 17.
; PLAN: r0=51(x1), r1=210(y1), r2=225(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=22(y), r7=45(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=132(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 210
LDI r2, 225
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 22
LDI r7, 45
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 132
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
