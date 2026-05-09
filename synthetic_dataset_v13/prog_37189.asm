; DESCRIPTION: Draws a orange line from (486, 202) to (468, 13).
; PLAN: r0=486(x1), r1=202(y1), r2=468(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 202
LDI r2, 468
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
