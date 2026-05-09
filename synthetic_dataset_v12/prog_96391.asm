; DESCRIPTION: Composite: Draws a blue line from (31, 119) to (290, 102) then Sets a single cyan pixel at (108, 212) then Draws a purple circle centered at (247, 117) with radius 56.
; PLAN: r0=31(x1), r1=119(y1), r2=290(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=117(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 119
LDI r2, 290
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 117
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
