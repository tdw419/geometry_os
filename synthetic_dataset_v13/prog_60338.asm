; DESCRIPTION: Composite: Draws a black circle centered at (276, 181) with radius 50 then Places a white 33x37 rectangle at position (8, 117) then Draws a yellow line from (476, 82) to (172, 0).
; PLAN: r0=276(x), r1=181(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=117(y), r7=33(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x1), r11=82(y1), r12=172(x2), r13=0(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 181
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 117
LDI r7, 33
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 82
LDI r12, 172
LDI r13, 0
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
