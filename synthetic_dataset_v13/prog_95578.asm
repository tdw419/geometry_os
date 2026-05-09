; DESCRIPTION: Composite: Renders a white box of size 94x12 starting at (392, 181) then Draws a white circle centered at (166, 19) with radius 14 then Places a orange line segment connecting (437, 108) to (135, 125).
; PLAN: r0=392(x), r1=181(y), r2=94(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=19(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x1), r11=108(y1), r12=135(x2), r13=125(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 181
LDI r2, 94
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 19
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 108
LDI r12, 135
LDI r13, 125
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
