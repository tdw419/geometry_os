; DESCRIPTION: Composite: Draws a purple rectangle at (83, 71) with width 31 and height 41 then Renders a black line between points (342, 19) and (253, 116) then Draws a orange circle centered at (253, 201) with radius 31.
; PLAN: r0=83(x), r1=71(y), r2=31(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=19(y1), r7=253(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=201(y), r12=31(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 71
LDI r2, 31
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 19
LDI r7, 253
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 201
LDI r12, 31
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
