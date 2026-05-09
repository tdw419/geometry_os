; DESCRIPTION: Composite: Places a purple line segment connecting (111, 24) to (477, 11) then Draws a yellow circle centered at (210, 156) with radius 74 then Places a red 55x83 rectangle at position (391, 94).
; PLAN: r0=111(x1), r1=24(y1), r2=477(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=156(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=94(y), r12=55(width), r13=83(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 24
LDI r2, 477
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 156
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 94
LDI r12, 55
LDI r13, 83
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
