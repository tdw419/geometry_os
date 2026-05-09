; DESCRIPTION: Composite: Renders a yellow disk with center (431, 181) and radius 52 then Places a black 67x58 rectangle at position (53, 14) then Places a yellow line segment connecting (93, 78) to (458, 4).
; PLAN: r0=431(x), r1=181(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=14(y), r7=67(width), r8=58(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x1), r11=78(y1), r12=458(x2), r13=4(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 431
LDI r1, 181
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 14
LDI r7, 67
LDI r8, 58
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 78
LDI r12, 458
LDI r13, 4
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
