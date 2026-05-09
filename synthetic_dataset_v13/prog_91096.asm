; DESCRIPTION: Composite: Draws a white rectangle at (150, 0) with width 58 and height 79 then Places a yellow circle of radius 78 at center (344, 119) then Renders a green line between points (289, 23) and (208, 46).
; PLAN: r0=150(x), r1=0(y), r2=58(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=119(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x1), r11=23(y1), r12=208(x2), r13=46(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 0
LDI r2, 58
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 119
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 23
LDI r12, 208
LDI r13, 46
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
