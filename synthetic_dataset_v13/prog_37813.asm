; DESCRIPTION: Composite: Renders a green box of size 18x11 starting at (86, 217) then Draws a white circle centered at (390, 204) with radius 34 then Draws a yellow line from (229, 135) to (284, 234).
; PLAN: r0=86(x), r1=217(y), r2=18(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=204(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x1), r11=135(y1), r12=284(x2), r13=234(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 217
LDI r2, 18
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 204
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 135
LDI r12, 284
LDI r13, 234
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
