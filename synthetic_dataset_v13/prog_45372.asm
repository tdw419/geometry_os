; DESCRIPTION: Composite: Creates a orange circular shape at (276, 109) with radius 19 then Draws a red rectangle at (162, 168) with width 38 and height 68 then Places a yellow line segment connecting (498, 39) to (185, 113).
; PLAN: r0=276(x), r1=109(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=168(y), r7=38(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x1), r11=39(y1), r12=185(x2), r13=113(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 109
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 168
LDI r7, 38
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 39
LDI r12, 185
LDI r13, 113
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
