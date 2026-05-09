; DESCRIPTION: Composite: Draws a blue rectangle at (66, 159) with width 62 and height 60 then Creates a blue circular shape at (130, 53) with radius 45 then Renders a white line between points (412, 152) and (431, 66).
; PLAN: r0=66(x), r1=159(y), r2=62(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=53(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x1), r11=152(y1), r12=431(x2), r13=66(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 159
LDI r2, 62
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 53
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 152
LDI r12, 431
LDI r13, 66
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
