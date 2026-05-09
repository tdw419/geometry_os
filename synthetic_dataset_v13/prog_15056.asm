; DESCRIPTION: Composite: Renders a yellow line between points (372, 41) and (83, 154) then Creates a blue circular shape at (129, 165) with radius 44 then Renders a black box of size 69x76 starting at (76, 26).
; PLAN: r0=372(x1), r1=41(y1), r2=83(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=165(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=26(y), r12=69(width), r13=76(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 41
LDI r2, 83
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 165
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 26
LDI r12, 69
LDI r13, 76
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
