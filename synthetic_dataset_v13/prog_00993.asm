; DESCRIPTION: Composite: Draws a cyan rectangle at (61, 113) with width 83 and height 86 then Renders a orange line between points (237, 163) and (164, 155) then Draws a yellow circle centered at (434, 132) with radius 61.
; PLAN: r0=61(x), r1=113(y), r2=83(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x1), r6=163(y1), r7=164(x2), r8=155(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=132(y), r12=61(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 113
LDI r2, 83
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 163
LDI r7, 164
LDI r8, 155
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 132
LDI r12, 61
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
