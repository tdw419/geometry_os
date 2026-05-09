; DESCRIPTION: Composite: Draws a purple line from (62, 187) to (328, 107) then Draws a black rectangle at (358, 100) with width 111 and height 29 then Draws a red circle centered at (379, 64) with radius 14.
; PLAN: r0=62(x1), r1=187(y1), r2=328(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=100(y), r7=111(width), r8=29(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=64(y), r12=14(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 187
LDI r2, 328
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 100
LDI r7, 111
LDI r8, 29
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 64
LDI r12, 14
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
