; DESCRIPTION: Draws a orange line from (135, 76) to (345, 76).
; PLAN: r0=135(x1), r1=76(y1), r2=345(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 76
LDI r2, 345
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
