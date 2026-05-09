; DESCRIPTION: Composite: Renders a orange line between points (10, 24) and (385, 160) then Renders a yellow box of size 71x84 starting at (65, 63) then Draws a yellow circle centered at (382, 129) with radius 22.
; PLAN: r0=10(x1), r1=24(y1), r2=385(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=63(y), r7=71(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=129(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 24
LDI r2, 385
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 63
LDI r7, 71
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 129
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
