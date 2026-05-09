; DESCRIPTION: Composite: Draws a red line from (188, 36) to (99, 244) then Creates a orange circular shape at (19, 137) with radius 19 then Renders a green box of size 62x62 starting at (267, 120).
; PLAN: r0=188(x1), r1=36(y1), r2=99(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=19(x), r6=137(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=267(x), r11=120(y), r12=62(width), r13=62(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 36
LDI r2, 99
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 137
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 267
LDI r11, 120
LDI r12, 62
LDI r13, 62
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
