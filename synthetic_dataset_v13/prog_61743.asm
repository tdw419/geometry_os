; DESCRIPTION: Draws a magenta line from (383, 143) to (62, 99).
; PLAN: r0=383(x1), r1=143(y1), r2=62(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 143
LDI r2, 62
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
