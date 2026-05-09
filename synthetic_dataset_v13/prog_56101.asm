; DESCRIPTION: Draws a orange line from (70, 34) to (40, 180).
; PLAN: r0=70(x1), r1=34(y1), r2=40(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 34
LDI r2, 40
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
