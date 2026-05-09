; DESCRIPTION: Draws a magenta line from (383, 154) to (484, 63).
; PLAN: r0=383(x1), r1=154(y1), r2=484(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 154
LDI r2, 484
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
