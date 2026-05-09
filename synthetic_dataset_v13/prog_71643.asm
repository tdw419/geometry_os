; DESCRIPTION: Composite: Draws a orange line from (499, 244) to (454, 100) then Sets a single red pixel at (281, 168).
; PLAN: r0=499(x1), r1=244(y1), r2=454(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=168(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 499
LDI r1, 244
LDI r2, 454
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 168
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
