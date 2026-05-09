; DESCRIPTION: Draws a red line from (362, 234) to (301, 23).
; PLAN: r0=362(x1), r1=234(y1), r2=301(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 234
LDI r2, 301
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
