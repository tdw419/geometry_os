; DESCRIPTION: Draws a orange line from (270, 211) to (468, 162).
; PLAN: r0=270(x1), r1=211(y1), r2=468(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 211
LDI r2, 468
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
