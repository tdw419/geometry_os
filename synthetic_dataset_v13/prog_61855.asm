; DESCRIPTION: Composite: Renders a black disk with center (344, 148) and radius 41 then Renders a red box of size 70x36 starting at (126, 160) then Places a magenta line segment connecting (244, 2) to (137, 11).
; PLAN: r0=344(x), r1=148(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=160(y), r7=70(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x1), r11=2(y1), r12=137(x2), r13=11(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 148
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 160
LDI r7, 70
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 2
LDI r12, 137
LDI r13, 11
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
