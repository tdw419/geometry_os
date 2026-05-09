; DESCRIPTION: Composite: Renders a yellow box of size 76x75 starting at (409, 12) then Draws a yellow circle centered at (164, 173) with radius 75 then Places a yellow line segment connecting (265, 206) to (191, 145).
; PLAN: r0=409(x), r1=12(y), r2=76(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=173(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x1), r11=206(y1), r12=191(x2), r13=145(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 12
LDI r2, 76
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 173
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 206
LDI r12, 191
LDI r13, 145
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
