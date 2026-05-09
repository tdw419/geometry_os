; DESCRIPTION: Draws a magenta line from (481, 150) to (31, 3).
; PLAN: r0=481(x1), r1=150(y1), r2=31(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 150
LDI r2, 31
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
