; DESCRIPTION: Composite: Places a green line segment connecting (25, 58) to (174, 41) then Creates a blue circular shape at (179, 157) with radius 76 then Places a purple 35x61 rectangle at position (278, 132).
; PLAN: r0=25(x1), r1=58(y1), r2=174(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=157(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=278(x), r11=132(y), r12=35(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 58
LDI r2, 174
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 157
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 278
LDI r11, 132
LDI r12, 35
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
