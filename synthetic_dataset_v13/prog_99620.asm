; DESCRIPTION: Draws a orange line from (110, 133) to (136, 166).
; PLAN: r0=110(x1), r1=133(y1), r2=136(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 133
LDI r2, 136
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
