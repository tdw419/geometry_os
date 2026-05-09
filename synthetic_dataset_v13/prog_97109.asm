; DESCRIPTION: Composite: Creates a black rectangular region at (396, 130) spanning 80 by 76 pixels then Draws a orange line from (77, 102) to (267, 46) then Places a purple circle of radius 52 at center (241, 204).
; PLAN: r0=396(x), r1=130(y), r2=80(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x1), r6=102(y1), r7=267(x2), r8=46(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=204(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 130
LDI r2, 80
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 102
LDI r7, 267
LDI r8, 46
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 204
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
