; DESCRIPTION: Draws a magenta line from (167, 198) to (22, 151).
; PLAN: r0=167(x1), r1=198(y1), r2=22(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 198
LDI r2, 22
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
