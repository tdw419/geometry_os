; DESCRIPTION: Composite: Draws a orange line from (210, 7) to (86, 167) then Creates a white circular shape at (256, 207) with radius 14 then Draws a red rectangle at (165, 143) with width 88 and height 104.
; PLAN: r0=210(x1), r1=7(y1), r2=86(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=207(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=165(x), r11=143(y), r12=88(width), r13=104(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 7
LDI r2, 86
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 207
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 165
LDI r11, 143
LDI r12, 88
LDI r13, 104
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
