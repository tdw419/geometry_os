; DESCRIPTION: Composite: Draws a purple line from (296, 135) to (182, 71) then Draws a blue circle centered at (486, 86) with radius 14 then Places a red 119x120 rectangle at position (381, 65).
; PLAN: r0=296(x1), r1=135(y1), r2=182(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=86(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=65(y), r12=119(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 135
LDI r2, 182
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 86
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 65
LDI r12, 119
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
