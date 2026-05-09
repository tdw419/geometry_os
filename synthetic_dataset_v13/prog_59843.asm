; DESCRIPTION: Composite: Draws a green line from (75, 133) to (253, 148) then Sets a single yellow pixel at (502, 170) then Creates a blue rectangular region at (338, 23) spanning 43 by 117 pixels.
; PLAN: r0=75(x1), r1=133(y1), r2=253(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=170(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=23(y), r12=43(width), r13=117(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 133
LDI r2, 253
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 170
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 338
LDI r11, 23
LDI r12, 43
LDI r13, 117
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
