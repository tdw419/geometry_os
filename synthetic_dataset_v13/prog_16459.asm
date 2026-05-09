; DESCRIPTION: Composite: Places a magenta dot at position (130, 41) then Renders a yellow box of size 109x62 starting at (272, 186) then Draws a orange line from (480, 130) to (31, 136).
; PLAN: r0=130(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=186(y), r7=109(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=480(x1), r11=130(y1), r12=31(x2), r13=136(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 186
LDI r7, 109
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 130
LDI r12, 31
LDI r13, 136
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
