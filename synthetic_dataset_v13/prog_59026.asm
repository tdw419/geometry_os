; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (425, 181) then Draws a green rectangle at (146, 131) with width 113 and height 62 then Places a yellow line segment connecting (172, 214) to (28, 169).
; PLAN: r0=425(x), r1=181(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=131(y), r7=113(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x1), r11=214(y1), r12=28(x2), r13=169(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 181
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 131
LDI r7, 113
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 214
LDI r12, 28
LDI r13, 169
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
