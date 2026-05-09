; DESCRIPTION: Composite: Places a orange line segment connecting (497, 138) to (282, 143) then Places a green circle of radius 57 at center (206, 85) then Places a orange 32x25 rectangle at position (212, 49).
; PLAN: r0=497(x1), r1=138(y1), r2=282(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=85(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=49(y), r12=32(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 138
LDI r2, 282
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 85
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 49
LDI r12, 32
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
