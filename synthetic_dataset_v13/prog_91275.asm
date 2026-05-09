; DESCRIPTION: Composite: Renders a white line between points (402, 211) and (469, 88) then Draws a orange circle centered at (200, 135) with radius 61 then Places a magenta 110x42 rectangle at position (290, 207).
; PLAN: r0=402(x1), r1=211(y1), r2=469(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=135(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x), r11=207(y), r12=110(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 211
LDI r2, 469
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 135
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 207
LDI r12, 110
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
