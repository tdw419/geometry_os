; DESCRIPTION: Composite: Draws a red line from (154, 114) to (444, 111) then Creates a red circular shape at (436, 158) with radius 32 then Draws a white rectangle at (411, 136) with width 21 and height 52.
; PLAN: r0=154(x1), r1=114(y1), r2=444(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=158(y), r7=32(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x), r11=136(y), r12=21(width), r13=52(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 114
LDI r2, 444
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 158
LDI r7, 32
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 136
LDI r12, 21
LDI r13, 52
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
