; DESCRIPTION: Draws a orange line from (393, 208) to (56, 157).
; PLAN: r0=393(x1), r1=208(y1), r2=56(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 208
LDI r2, 56
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
