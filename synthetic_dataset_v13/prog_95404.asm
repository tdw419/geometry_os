; DESCRIPTION: Composite: Sets a single green pixel at (1, 26) then Draws a purple circle centered at (326, 116) with radius 56 then Draws a orange line from (428, 157) to (457, 203).
; PLAN: r0=1(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=116(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x1), r11=157(y1), r12=457(x2), r13=203(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 326
LDI r6, 116
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 157
LDI r12, 457
LDI r13, 203
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
