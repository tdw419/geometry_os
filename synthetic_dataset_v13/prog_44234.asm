; DESCRIPTION: Draws a orange line from (438, 243) to (511, 163).
; PLAN: r0=438(x1), r1=243(y1), r2=511(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 243
LDI r2, 511
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
