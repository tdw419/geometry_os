; DESCRIPTION: Composite: Draws a blue line from (462, 232) to (226, 223) then Draws a yellow circle centered at (44, 200) with radius 44 then Creates a orange rectangular region at (304, 27) spanning 90 by 100 pixels.
; PLAN: r0=462(x1), r1=232(y1), r2=226(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=200(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=27(y), r12=90(width), r13=100(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 232
LDI r2, 226
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 200
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 27
LDI r12, 90
LDI r13, 100
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
