; DESCRIPTION: Draws a orange line from (322, 26) to (2, 220).
; PLAN: r0=322(x1), r1=26(y1), r2=2(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 26
LDI r2, 2
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
