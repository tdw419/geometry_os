; DESCRIPTION: Draws a orange line from (99, 87) to (182, 83).
; PLAN: r0=99(x1), r1=87(y1), r2=182(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 87
LDI r2, 182
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
