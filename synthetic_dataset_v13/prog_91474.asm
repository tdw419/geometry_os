; DESCRIPTION: Composite: Draws a red line from (352, 100) to (89, 123) then Places a green circle of radius 58 at center (212, 97) then Sets a single magenta pixel at (240, 123).
; PLAN: r0=352(x1), r1=100(y1), r2=89(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=97(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x), r11=123(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 100
LDI r2, 89
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 97
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 123
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
