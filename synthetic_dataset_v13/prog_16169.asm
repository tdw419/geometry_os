; DESCRIPTION: Composite: Creates a orange rectangular region at (375, 15) spanning 47 by 41 pixels then Renders a black line between points (270, 14) and (175, 68) then Places a blue circle of radius 53 at center (253, 67).
; PLAN: r0=375(x), r1=15(y), r2=47(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x1), r6=14(y1), r7=175(x2), r8=68(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=67(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 15
LDI r2, 47
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 14
LDI r7, 175
LDI r8, 68
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 67
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
