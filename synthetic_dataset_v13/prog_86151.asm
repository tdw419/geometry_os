; DESCRIPTION: Composite: Draws a red rectangle at (23, 99) with width 113 and height 89 then Creates a yellow circular shape at (299, 145) with radius 36 then Draws a yellow line from (236, 56) to (109, 234).
; PLAN: r0=23(x), r1=99(y), r2=113(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=145(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x1), r11=56(y1), r12=109(x2), r13=234(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 99
LDI r2, 113
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 145
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 56
LDI r12, 109
LDI r13, 234
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
