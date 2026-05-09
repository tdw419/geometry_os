; DESCRIPTION: Draws a magenta line from (432, 66) to (108, 28).
; PLAN: r0=432(x1), r1=66(y1), r2=108(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 66
LDI r2, 108
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
