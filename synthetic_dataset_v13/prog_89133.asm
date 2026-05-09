; DESCRIPTION: Composite: Creates a orange circular shape at (286, 178) with radius 20 then Places a magenta line segment connecting (232, 51) to (137, 44) then Places a red 33x76 rectangle at position (414, 26).
; PLAN: r0=286(x), r1=178(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=51(y1), r7=137(x2), r8=44(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=26(y), r12=33(width), r13=76(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 178
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 51
LDI r7, 137
LDI r8, 44
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 26
LDI r12, 33
LDI r13, 76
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
