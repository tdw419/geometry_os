; DESCRIPTION: Composite: Renders a green box of size 80x103 starting at (125, 137) then Creates a orange circular shape at (391, 128) with radius 56 then Draws a green line from (90, 69) to (26, 17).
; PLAN: r0=125(x), r1=137(y), r2=80(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=128(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x1), r11=69(y1), r12=26(x2), r13=17(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 137
LDI r2, 80
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 128
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 69
LDI r12, 26
LDI r13, 17
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
