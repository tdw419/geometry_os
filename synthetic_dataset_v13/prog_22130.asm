; DESCRIPTION: Composite: Places a yellow line segment connecting (98, 63) to (47, 29) then Creates a yellow circular shape at (303, 199) with radius 34 then Creates a yellow rectangular region at (391, 73) spanning 13 by 60 pixels.
; PLAN: r0=98(x1), r1=63(y1), r2=47(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=199(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=73(y), r12=13(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 63
LDI r2, 47
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 199
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 73
LDI r12, 13
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
