; DESCRIPTION: Draws a orange line from (445, 197) to (149, 160).
; PLAN: r0=445(x1), r1=197(y1), r2=149(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 197
LDI r2, 149
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
