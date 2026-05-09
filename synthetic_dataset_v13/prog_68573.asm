; DESCRIPTION: Composite: Draws a green line from (121, 61) to (271, 212) then Draws a red circle centered at (118, 136) with radius 25 then Places a magenta 23x88 rectangle at position (469, 94).
; PLAN: r0=121(x1), r1=61(y1), r2=271(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=136(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=94(y), r12=23(width), r13=88(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 61
LDI r2, 271
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 136
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 94
LDI r12, 23
LDI r13, 88
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
