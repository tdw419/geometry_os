; DESCRIPTION: Composite: Creates a white rectangular region at (213, 21) spanning 26 by 70 pixels then Places a red line segment connecting (469, 160) to (437, 122) then Renders a white disk with center (390, 124) and radius 78.
; PLAN: r0=213(x), r1=21(y), r2=26(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=160(y1), r7=437(x2), r8=122(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=124(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 21
LDI r2, 26
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 160
LDI r7, 437
LDI r8, 122
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 124
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
