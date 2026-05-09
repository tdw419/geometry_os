; DESCRIPTION: Composite: Creates a orange circular shape at (291, 62) with radius 29 then Renders a orange line between points (110, 158) and (476, 79) then Places a red 11x66 rectangle at position (425, 182).
; PLAN: r0=291(x), r1=62(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x1), r6=158(y1), r7=476(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=182(y), r12=11(width), r13=66(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 62
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 158
LDI r7, 476
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 182
LDI r12, 11
LDI r13, 66
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
