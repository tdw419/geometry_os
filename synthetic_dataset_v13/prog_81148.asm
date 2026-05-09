; DESCRIPTION: Composite: Draws a orange rectangle at (252, 129) with width 55 and height 103 then Creates a black circular shape at (401, 200) with radius 35 then Places a green line segment connecting (112, 102) to (44, 58).
; PLAN: r0=252(x), r1=129(y), r2=55(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=200(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x1), r11=102(y1), r12=44(x2), r13=58(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 129
LDI r2, 55
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 200
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 102
LDI r12, 44
LDI r13, 58
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
