; DESCRIPTION: Draws a magenta line from (200, 245) to (301, 156).
; PLAN: r0=200(x1), r1=245(y1), r2=301(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 245
LDI r2, 301
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
