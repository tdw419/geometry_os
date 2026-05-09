; DESCRIPTION: Draws a magenta line from (381, 200) to (383, 151).
; PLAN: r0=381(x1), r1=200(y1), r2=383(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 200
LDI r2, 383
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
