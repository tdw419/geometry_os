; DESCRIPTION: Draws a red line from (347, 27) to (390, 110).
; PLAN: r0=347(x1), r1=27(y1), r2=390(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 27
LDI r2, 390
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
