; DESCRIPTION: Composite: Renders a orange box of size 109x88 starting at (390, 52) then Draws a magenta circle centered at (308, 121) with radius 66 then Places a cyan line segment connecting (121, 178) to (317, 57).
; PLAN: r0=390(x), r1=52(y), r2=109(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=121(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x1), r11=178(y1), r12=317(x2), r13=57(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 52
LDI r2, 109
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 121
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 178
LDI r12, 317
LDI r13, 57
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
