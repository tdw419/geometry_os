; DESCRIPTION: Composite: Renders a black disk with center (62, 79) and radius 16 then Places a black line segment connecting (477, 183) to (164, 199) then Places a orange 25x49 rectangle at position (206, 165).
; PLAN: r0=62(x), r1=79(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=183(y1), r7=164(x2), r8=199(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=165(y), r12=25(width), r13=49(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 79
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 183
LDI r7, 164
LDI r8, 199
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 165
LDI r12, 25
LDI r13, 49
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
