; DESCRIPTION: Composite: Draws a yellow circle centered at (257, 91) with radius 16 then Draws a green line from (244, 163) to (371, 143) then Places a yellow 90x109 rectangle at position (8, 2).
; PLAN: r0=257(x), r1=91(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x1), r6=163(y1), r7=371(x2), r8=143(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=8(x), r11=2(y), r12=90(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 91
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 163
LDI r7, 371
LDI r8, 143
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 2
LDI r12, 90
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
