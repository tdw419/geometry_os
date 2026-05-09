; DESCRIPTION: Composite: Renders a green line between points (286, 83) and (424, 39) then Creates a black rectangular region at (112, 114) spanning 107 by 51 pixels then Creates a yellow circular shape at (441, 185) with radius 57.
; PLAN: r0=286(x1), r1=83(y1), r2=424(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=114(y), r7=107(width), r8=51(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=185(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 83
LDI r2, 424
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 114
LDI r7, 107
LDI r8, 51
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 185
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
