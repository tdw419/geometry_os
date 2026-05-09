; DESCRIPTION: Draws a orange line from (347, 240) to (360, 9).
; PLAN: r0=347(x1), r1=240(y1), r2=360(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 240
LDI r2, 360
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
