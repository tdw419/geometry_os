; DESCRIPTION: Composite: Places a black line segment connecting (303, 97) to (400, 216) then Places a white circle of radius 78 at center (181, 127) then Places a red 13x63 rectangle at position (79, 114).
; PLAN: r0=303(x1), r1=97(y1), r2=400(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=127(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=114(y), r12=13(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 97
LDI r2, 400
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 127
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 114
LDI r12, 13
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
