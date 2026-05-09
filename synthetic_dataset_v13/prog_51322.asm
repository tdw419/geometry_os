; DESCRIPTION: Composite: Places a yellow line segment connecting (197, 1) to (296, 89) then Renders a white disk with center (194, 34) and radius 12 then Draws a orange rectangle at (111, 73) with width 98 and height 16.
; PLAN: r0=197(x1), r1=1(y1), r2=296(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=34(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x), r11=73(y), r12=98(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 1
LDI r2, 296
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 34
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 73
LDI r12, 98
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
