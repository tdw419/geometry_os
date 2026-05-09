; DESCRIPTION: Composite: Draws a cyan rectangle at (69, 127) with width 57 and height 116 then Places a black circle of radius 69 at center (139, 159) then Places a orange line segment connecting (200, 249) to (115, 6).
; PLAN: r0=69(x), r1=127(y), r2=57(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=159(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x1), r11=249(y1), r12=115(x2), r13=6(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 127
LDI r2, 57
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 159
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 249
LDI r12, 115
LDI r13, 6
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
