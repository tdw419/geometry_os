; DESCRIPTION: Composite: Renders a purple disk with center (120, 89) and radius 59 then Draws a black rectangle at (72, 82) with width 71 and height 104 then Places a orange line segment connecting (297, 44) to (262, 92).
; PLAN: r0=120(x), r1=89(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=82(y), r7=71(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x1), r11=44(y1), r12=262(x2), r13=92(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 89
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 82
LDI r7, 71
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 44
LDI r12, 262
LDI r13, 92
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
