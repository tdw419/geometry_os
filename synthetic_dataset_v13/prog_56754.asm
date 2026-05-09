; DESCRIPTION: Draws a orange line from (484, 161) to (18, 255).
; PLAN: r0=484(x1), r1=161(y1), r2=18(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 161
LDI r2, 18
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
