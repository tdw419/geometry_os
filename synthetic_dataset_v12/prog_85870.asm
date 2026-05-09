; DESCRIPTION: Composite: Creates a yellow rectangular region at (82, 159) spanning 71 by 16 pixels then Renders a blue line between points (283, 49) and (170, 250) then Creates a magenta circular shape at (117, 174) with radius 45.
; PLAN: r0=82(x), r1=159(y), r2=71(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=49(y1), r7=170(x2), r8=250(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=174(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 159
LDI r2, 71
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 49
LDI r7, 170
LDI r8, 250
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 174
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
