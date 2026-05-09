; DESCRIPTION: Composite: Draws a black circle centered at (170, 77) with radius 59 then Draws a orange line from (245, 108) to (122, 201) then Creates a cyan rectangular region at (477, 56) spanning 35 by 11 pixels.
; PLAN: r0=170(x), r1=77(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x1), r6=108(y1), r7=122(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=477(x), r11=56(y), r12=35(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 77
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 108
LDI r7, 122
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 56
LDI r12, 35
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
