; DESCRIPTION: Composite: Draws a orange line from (364, 116) to (138, 178) then Sets a single yellow pixel at (302, 8).
; PLAN: r0=364(x1), r1=116(y1), r2=138(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 116
LDI r2, 138
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
