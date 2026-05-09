; DESCRIPTION: Composite: Places a white line segment connecting (392, 243) to (134, 131) then Draws a black rectangle at (183, 110) with width 64 and height 36 then Places a orange circle of radius 33 at center (316, 211).
; PLAN: r0=392(x1), r1=243(y1), r2=134(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=110(y), r7=64(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=316(x), r11=211(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 243
LDI r2, 134
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 110
LDI r7, 64
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 211
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
