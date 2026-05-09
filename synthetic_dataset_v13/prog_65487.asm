; DESCRIPTION: Composite: Creates a black circular shape at (102, 164) with radius 57 then Draws a yellow line from (325, 50) to (421, 58) then Draws a purple rectangle at (124, 30) with width 47 and height 10.
; PLAN: r0=102(x), r1=164(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=50(y1), r7=421(x2), r8=58(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=30(y), r12=47(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 164
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 50
LDI r7, 421
LDI r8, 58
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 30
LDI r12, 47
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
