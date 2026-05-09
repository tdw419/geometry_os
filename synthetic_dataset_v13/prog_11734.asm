; DESCRIPTION: Composite: Places a yellow 10x68 rectangle at position (489, 17) then Draws a green circle centered at (281, 119) with radius 27 then Places a white line segment connecting (54, 134) to (108, 156).
; PLAN: r0=489(x), r1=17(y), r2=10(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=119(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x1), r11=134(y1), r12=108(x2), r13=156(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 17
LDI r2, 10
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 119
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 134
LDI r12, 108
LDI r13, 156
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
