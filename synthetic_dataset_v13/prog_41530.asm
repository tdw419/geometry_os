; DESCRIPTION: Composite: Renders a white disk with center (385, 79) and radius 72 then Draws a white line from (494, 72) to (316, 104) then Renders a blue box of size 92x22 starting at (31, 127).
; PLAN: r0=385(x), r1=79(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=72(y1), r7=316(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=127(y), r12=92(width), r13=22(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 79
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 72
LDI r7, 316
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 127
LDI r12, 92
LDI r13, 22
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
