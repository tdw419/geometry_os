; DESCRIPTION: Composite: Draws a green line from (347, 108) to (222, 43) then Creates a orange circular shape at (268, 132) with radius 16 then Creates a blue rectangular region at (226, 39) spanning 73 by 53 pixels.
; PLAN: r0=347(x1), r1=108(y1), r2=222(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=132(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x), r11=39(y), r12=73(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 108
LDI r2, 222
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 132
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 39
LDI r12, 73
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
