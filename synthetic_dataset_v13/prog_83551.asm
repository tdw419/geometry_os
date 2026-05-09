; DESCRIPTION: Composite: Draws a purple rectangle at (380, 49) with width 112 and height 45 then Creates a yellow circular shape at (278, 165) with radius 63 then Draws a green line from (324, 207) to (87, 16).
; PLAN: r0=380(x), r1=49(y), r2=112(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=165(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=207(y1), r12=87(x2), r13=16(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 49
LDI r2, 112
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 165
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 207
LDI r12, 87
LDI r13, 16
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
