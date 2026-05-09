; DESCRIPTION: Composite: Draws a black rectangle at (415, 184) with width 27 and height 60 then Places a yellow circle of radius 58 at center (80, 78) then Places a white line segment connecting (471, 241) to (18, 234).
; PLAN: r0=415(x), r1=184(y), r2=27(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=78(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x1), r11=241(y1), r12=18(x2), r13=234(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 184
LDI r2, 27
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 78
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 241
LDI r12, 18
LDI r13, 234
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
