; DESCRIPTION: Composite: Renders a green line between points (67, 244) and (382, 197) then Creates a blue rectangular region at (84, 138) spanning 75 by 83 pixels then Places a orange circle of radius 19 at center (245, 166).
; PLAN: r0=67(x1), r1=244(y1), r2=382(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=138(y), r7=75(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=166(y), r12=19(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 244
LDI r2, 382
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 138
LDI r7, 75
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 166
LDI r12, 19
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
