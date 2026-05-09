; DESCRIPTION: Composite: Creates a purple rectangular region at (9, 104) spanning 47 by 46 pixels then Creates a purple circular shape at (65, 98) with radius 37 then Draws a magenta line from (465, 8) to (246, 181).
; PLAN: r0=9(x), r1=104(y), r2=47(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=98(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x1), r11=8(y1), r12=246(x2), r13=181(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 104
LDI r2, 47
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 98
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 8
LDI r12, 246
LDI r13, 181
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
