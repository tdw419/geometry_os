; DESCRIPTION: Composite: Draws a orange line from (10, 192) to (182, 222) then Sets a single white pixel at (301, 100).
; PLAN: r0=10(x1), r1=192(y1), r2=182(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 192
LDI r2, 182
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
