; DESCRIPTION: Composite: Places a red line segment connecting (49, 186) to (1, 105) then Renders a white disk with center (207, 187) and radius 60 then Creates a red rectangular region at (414, 37) spanning 61 by 18 pixels.
; PLAN: r0=49(x1), r1=186(y1), r2=1(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=187(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x), r11=37(y), r12=61(width), r13=18(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 186
LDI r2, 1
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 187
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 37
LDI r12, 61
LDI r13, 18
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
