; DESCRIPTION: Composite: Places a blue line segment connecting (103, 218) to (40, 126) then Creates a green circular shape at (189, 45) with radius 10 then Places a purple 84x13 rectangle at position (122, 161).
; PLAN: r0=103(x1), r1=218(y1), r2=40(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=45(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=161(y), r12=84(width), r13=13(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 218
LDI r2, 40
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 45
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 161
LDI r12, 84
LDI r13, 13
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
