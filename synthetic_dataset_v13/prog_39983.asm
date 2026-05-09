; DESCRIPTION: Composite: Renders a white line between points (382, 22) and (357, 128) then Renders a green disk with center (220, 140) and radius 46 then Draws a blue rectangle at (423, 41) with width 24 and height 55.
; PLAN: r0=382(x1), r1=22(y1), r2=357(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=140(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=41(y), r12=24(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 22
LDI r2, 357
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 140
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 41
LDI r12, 24
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
