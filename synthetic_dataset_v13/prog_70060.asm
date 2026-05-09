; DESCRIPTION: Composite: Draws a cyan rectangle at (94, 24) with width 19 and height 28 then Places a orange line segment connecting (248, 101) to (214, 124) then Places a red circle of radius 21 at center (226, 121).
; PLAN: r0=94(x), r1=24(y), r2=19(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=101(y1), r7=214(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=226(x), r11=121(y), r12=21(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 24
LDI r2, 19
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 101
LDI r7, 214
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 121
LDI r12, 21
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
