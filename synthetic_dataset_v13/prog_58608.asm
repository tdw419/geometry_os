; DESCRIPTION: Composite: Places a yellow line segment connecting (297, 63) to (45, 214) then Sets a single white pixel at (14, 183) then Draws a green rectangle at (287, 60) with width 74 and height 36.
; PLAN: r0=297(x1), r1=63(y1), r2=45(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=183(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=60(y), r12=74(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 63
LDI r2, 45
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 183
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 60
LDI r12, 74
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
