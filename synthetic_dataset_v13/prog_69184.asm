; DESCRIPTION: Composite: Draws a blue circle centered at (18, 187) with radius 14 then Places a red line segment connecting (484, 116) to (46, 5) then Places a green 79x52 rectangle at position (95, 95).
; PLAN: r0=18(x), r1=187(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=116(y1), r7=46(x2), r8=5(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=95(x), r11=95(y), r12=79(width), r13=52(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 187
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 116
LDI r7, 46
LDI r8, 5
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 95
LDI r12, 79
LDI r13, 52
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
