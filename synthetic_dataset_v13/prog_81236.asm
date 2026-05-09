; DESCRIPTION: Composite: Renders a blue line between points (449, 32) and (197, 66) then Renders a orange disk with center (203, 164) and radius 23 then Creates a orange rectangular region at (396, 3) spanning 70 by 119 pixels.
; PLAN: r0=449(x1), r1=32(y1), r2=197(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=164(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=3(y), r12=70(width), r13=119(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 32
LDI r2, 197
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 164
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 3
LDI r12, 70
LDI r13, 119
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
