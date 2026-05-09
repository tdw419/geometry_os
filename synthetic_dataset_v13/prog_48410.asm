; DESCRIPTION: Composite: Creates a blue rectangular region at (87, 46) spanning 35 by 53 pixels then Creates a red circular shape at (444, 109) with radius 33 then Places a purple line segment connecting (443, 165) to (270, 66).
; PLAN: r0=87(x), r1=46(y), r2=35(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=109(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x1), r11=165(y1), r12=270(x2), r13=66(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 46
LDI r2, 35
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 109
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 165
LDI r12, 270
LDI r13, 66
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
