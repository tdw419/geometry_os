; DESCRIPTION: Composite: Creates a yellow rectangular region at (335, 152) spanning 70 by 86 pixels then Draws a green line from (267, 4) to (104, 92) then Draws a blue circle centered at (316, 201) with radius 29.
; PLAN: r0=335(x), r1=152(y), r2=70(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x1), r6=4(y1), r7=104(x2), r8=92(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=201(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 152
LDI r2, 70
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 4
LDI r7, 104
LDI r8, 92
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 201
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
