; DESCRIPTION: Composite: Places a green line segment connecting (161, 244) to (189, 88) then Creates a orange circular shape at (77, 167) with radius 38 then Places a magenta 117x80 rectangle at position (354, 54).
; PLAN: r0=161(x1), r1=244(y1), r2=189(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=167(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=54(y), r12=117(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 244
LDI r2, 189
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 167
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 54
LDI r12, 117
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
