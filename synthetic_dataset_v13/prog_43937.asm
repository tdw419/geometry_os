; DESCRIPTION: Composite: Draws a yellow line from (205, 183) to (370, 111) then Places a blue circle of radius 45 at center (234, 75) then Draws a white rectangle at (316, 46) with width 19 and height 47.
; PLAN: r0=205(x1), r1=183(y1), r2=370(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=75(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=46(y), r12=19(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 183
LDI r2, 370
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 75
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 46
LDI r12, 19
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
