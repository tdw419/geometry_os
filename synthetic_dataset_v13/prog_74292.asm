; DESCRIPTION: Draws a orange line from (192, 23) to (510, 78).
; PLAN: r0=192(x1), r1=23(y1), r2=510(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 23
LDI r2, 510
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
