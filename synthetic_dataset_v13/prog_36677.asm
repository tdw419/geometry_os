; DESCRIPTION: Composite: Renders a orange box of size 40x57 starting at (357, 114) then Creates a black circular shape at (223, 56) with radius 55 then Places a black line segment connecting (154, 157) to (138, 113).
; PLAN: r0=357(x), r1=114(y), r2=40(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=56(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x1), r11=157(y1), r12=138(x2), r13=113(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 114
LDI r2, 40
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 56
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 157
LDI r12, 138
LDI r13, 113
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
