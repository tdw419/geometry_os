; DESCRIPTION: Composite: Renders a yellow line between points (387, 149) and (244, 190) then Places a purple 117x29 rectangle at position (376, 56) then Creates a magenta circular shape at (147, 69) with radius 48.
; PLAN: r0=387(x1), r1=149(y1), r2=244(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=56(y), r7=117(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=69(y), r12=48(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 149
LDI r2, 244
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 56
LDI r7, 117
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 69
LDI r12, 48
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
