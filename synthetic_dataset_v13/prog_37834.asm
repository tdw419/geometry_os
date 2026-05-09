; DESCRIPTION: Composite: Places a blue 21x28 rectangle at position (324, 225) then Renders a blue line between points (14, 68) and (478, 154) then Creates a orange circular shape at (278, 175) with radius 51.
; PLAN: r0=324(x), r1=225(y), r2=21(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=68(y1), r7=478(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=175(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 225
LDI r2, 21
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 68
LDI r7, 478
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 175
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
