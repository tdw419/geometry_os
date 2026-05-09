; DESCRIPTION: Draws a magenta line from (455, 16) to (383, 99).
; PLAN: r0=455(x1), r1=16(y1), r2=383(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 16
LDI r2, 383
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
