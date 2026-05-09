; DESCRIPTION: Composite: Creates a magenta circular shape at (184, 159) with radius 33 then Places a yellow line segment connecting (471, 2) to (166, 220) then Creates a black rectangular region at (33, 38) spanning 120 by 72 pixels.
; PLAN: r0=184(x), r1=159(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x1), r6=2(y1), r7=166(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=38(y), r12=120(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 159
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 2
LDI r7, 166
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 38
LDI r12, 120
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
