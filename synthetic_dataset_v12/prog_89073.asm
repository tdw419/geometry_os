; DESCRIPTION: Composite: Places a black line segment connecting (57, 104) to (236, 150) then Creates a blue circular shape at (316, 111) with radius 58 then Draws a cyan rectangle at (182, 82) with width 65 and height 117.
; PLAN: r0=57(x1), r1=104(y1), r2=236(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=111(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x), r11=82(y), r12=65(width), r13=117(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 104
LDI r2, 236
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 111
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 82
LDI r12, 65
LDI r13, 117
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
