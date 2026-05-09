; DESCRIPTION: Composite: Renders a orange box of size 62x48 starting at (22, 41) then Creates a green circular shape at (426, 175) with radius 70 then Draws a black line from (277, 140) to (405, 114).
; PLAN: r0=22(x), r1=41(y), r2=62(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=175(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x1), r11=140(y1), r12=405(x2), r13=114(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 41
LDI r2, 62
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 175
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 140
LDI r12, 405
LDI r13, 114
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
