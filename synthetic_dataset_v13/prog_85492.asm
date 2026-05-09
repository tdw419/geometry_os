; DESCRIPTION: Composite: Places a purple circle of radius 54 at center (118, 69) then Places a orange line segment connecting (465, 116) to (313, 189) then Places a red 103x17 rectangle at position (129, 45).
; PLAN: r0=118(x), r1=69(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=116(y1), r7=313(x2), r8=189(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=45(y), r12=103(width), r13=17(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 69
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 116
LDI r7, 313
LDI r8, 189
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 45
LDI r12, 103
LDI r13, 17
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
