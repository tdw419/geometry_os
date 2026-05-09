; DESCRIPTION: Composite: Creates a orange rectangular region at (283, 125) spanning 109 by 119 pixels then Renders a black line between points (36, 237) and (196, 149) then Creates a yellow circular shape at (235, 125) with radius 59.
; PLAN: r0=283(x), r1=125(y), r2=109(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=237(y1), r7=196(x2), r8=149(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=125(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 125
LDI r2, 109
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 237
LDI r7, 196
LDI r8, 149
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 125
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
