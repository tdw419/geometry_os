; DESCRIPTION: Draws a orange line from (74, 250) to (77, 150).
; PLAN: r0=74(x1), r1=250(y1), r2=77(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 250
LDI r2, 77
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
