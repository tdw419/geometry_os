; DESCRIPTION: Composite: Renders a cyan box of size 17x49 starting at (317, 101) then Draws a cyan circle centered at (411, 155) with radius 59 then Places a orange line segment connecting (200, 101) to (280, 144).
; PLAN: r0=317(x), r1=101(y), r2=17(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=155(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x1), r11=101(y1), r12=280(x2), r13=144(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 101
LDI r2, 17
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 155
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 101
LDI r12, 280
LDI r13, 144
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
