; DESCRIPTION: Composite: Places a orange line segment connecting (87, 81) to (287, 26) then Places a white 56x35 rectangle at position (37, 90) then Creates a orange circular shape at (236, 130) with radius 79.
; PLAN: r0=87(x1), r1=81(y1), r2=287(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=90(y), r7=56(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=130(y), r12=79(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 81
LDI r2, 287
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 90
LDI r7, 56
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 130
LDI r12, 79
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
