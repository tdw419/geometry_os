; DESCRIPTION: Composite: Places a orange 45x112 rectangle at position (336, 111) then Creates a magenta circular shape at (396, 43) with radius 20 then Draws a green line from (260, 204) to (107, 201).
; PLAN: r0=336(x), r1=111(y), r2=45(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=43(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x1), r11=204(y1), r12=107(x2), r13=201(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 111
LDI r2, 45
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 43
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 204
LDI r12, 107
LDI r13, 201
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
