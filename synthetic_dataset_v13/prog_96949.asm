; DESCRIPTION: Composite: Renders a green box of size 89x57 starting at (272, 163) then Draws a purple line from (451, 92) to (431, 194) then Creates a white circular shape at (239, 125) with radius 39.
; PLAN: r0=272(x), r1=163(y), r2=89(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x1), r6=92(y1), r7=431(x2), r8=194(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=125(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 163
LDI r2, 89
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 92
LDI r7, 431
LDI r8, 194
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 125
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
