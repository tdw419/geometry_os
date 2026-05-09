; DESCRIPTION: Composite: Renders a orange line between points (506, 134) and (219, 97) then Draws a yellow circle centered at (150, 131) with radius 59 then Renders a green box of size 70x57 starting at (313, 156).
; PLAN: r0=506(x1), r1=134(y1), r2=219(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=131(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=156(y), r12=70(width), r13=57(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 134
LDI r2, 219
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 131
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 156
LDI r12, 70
LDI r13, 57
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
