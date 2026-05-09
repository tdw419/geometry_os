; DESCRIPTION: Composite: Places a purple dot at position (156, 222) then Draws a orange circle centered at (107, 127) with radius 59 then Draws a white line from (409, 157) to (7, 22).
; PLAN: r0=156(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=127(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x1), r11=157(y1), r12=7(x2), r13=22(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 127
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 157
LDI r12, 7
LDI r13, 22
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
