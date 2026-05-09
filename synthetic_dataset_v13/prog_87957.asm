; DESCRIPTION: Draws a orange line from (86, 45) to (140, 9).
; PLAN: r0=86(x1), r1=45(y1), r2=140(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 45
LDI r2, 140
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
