; DESCRIPTION: Composite: Creates a orange rectangular region at (217, 141) spanning 106 by 108 pixels then Places a green circle of radius 65 at center (381, 83) then Draws a yellow line from (67, 194) to (459, 191).
; PLAN: r0=217(x), r1=141(y), r2=106(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=83(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x1), r11=194(y1), r12=459(x2), r13=191(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 141
LDI r2, 106
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 83
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 194
LDI r12, 459
LDI r13, 191
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
