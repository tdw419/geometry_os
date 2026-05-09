; DESCRIPTION: Composite: Draws a purple rectangle at (224, 16) with width 13 and height 17 then Draws a purple line from (308, 201) to (449, 225) then Creates a red circular shape at (347, 86) with radius 72.
; PLAN: r0=224(x), r1=16(y), r2=13(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=201(y1), r7=449(x2), r8=225(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=86(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 16
LDI r2, 13
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 201
LDI r7, 449
LDI r8, 225
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 86
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
