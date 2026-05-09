; DESCRIPTION: Composite: Creates a white circular shape at (420, 88) with radius 57 then Places a white 117x101 rectangle at position (235, 21) then Draws a orange line from (314, 126) to (194, 58).
; PLAN: r0=420(x), r1=88(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=21(y), r7=117(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x1), r11=126(y1), r12=194(x2), r13=58(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 88
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 21
LDI r7, 117
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 126
LDI r12, 194
LDI r13, 58
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
