; DESCRIPTION: Draws a orange line from (444, 205) to (395, 216).
; PLAN: r0=444(x1), r1=205(y1), r2=395(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 205
LDI r2, 395
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
