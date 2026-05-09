; DESCRIPTION: Composite: Draws a yellow circle centered at (103, 105) with radius 72 then Places a purple 84x102 rectangle at position (264, 63) then Draws a blue line from (363, 28) to (118, 60).
; PLAN: r0=103(x), r1=105(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=63(y), r7=84(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x1), r11=28(y1), r12=118(x2), r13=60(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 105
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 63
LDI r7, 84
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 28
LDI r12, 118
LDI r13, 60
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
