; DESCRIPTION: Composite: Renders a black box of size 100x14 starting at (206, 200) then Places a black circle of radius 21 at center (114, 176) then Places a red line segment connecting (432, 43) to (307, 164).
; PLAN: r0=206(x), r1=200(y), r2=100(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=176(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x1), r11=43(y1), r12=307(x2), r13=164(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 200
LDI r2, 100
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 176
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 43
LDI r12, 307
LDI r13, 164
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
