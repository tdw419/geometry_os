; DESCRIPTION: Draws a yellow line from (301, 245) to (97, 131).
; PLAN: r0=301(x1), r1=245(y1), r2=97(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 245
LDI r2, 97
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
