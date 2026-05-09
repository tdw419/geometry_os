; DESCRIPTION: Composite: Draws a black line from (126, 253) to (296, 84) then Draws a white circle centered at (400, 113) with radius 52 then Creates a orange rectangular region at (280, 55) spanning 48 by 117 pixels.
; PLAN: r0=126(x1), r1=253(y1), r2=296(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=113(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=55(y), r12=48(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 253
LDI r2, 296
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 113
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 55
LDI r12, 48
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
