; DESCRIPTION: Draws a orange line from (96, 54) to (144, 84).
; PLAN: r0=96(x1), r1=54(y1), r2=144(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 54
LDI r2, 144
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
