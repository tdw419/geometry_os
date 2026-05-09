; DESCRIPTION: Composite: Creates a cyan rectangular region at (174, 65) spanning 39 by 101 pixels then Sets a single yellow pixel at (84, 184) then Places a blue line segment connecting (475, 183) to (283, 122).
; PLAN: r0=174(x), r1=65(y), r2=39(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=184(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=475(x1), r11=183(y1), r12=283(x2), r13=122(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 65
LDI r2, 39
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 184
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 475
LDI r11, 183
LDI r12, 283
LDI r13, 122
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
