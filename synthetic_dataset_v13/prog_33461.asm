; DESCRIPTION: Composite: Creates a magenta circular shape at (418, 188) with radius 45 then Places a red line segment connecting (430, 169) to (511, 155) then Places a purple 76x86 rectangle at position (296, 127).
; PLAN: r0=418(x), r1=188(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x1), r6=169(y1), r7=511(x2), r8=155(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=127(y), r12=76(width), r13=86(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 188
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 169
LDI r7, 511
LDI r8, 155
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 127
LDI r12, 76
LDI r13, 86
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
