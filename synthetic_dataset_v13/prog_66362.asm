; DESCRIPTION: Draws a magenta line from (366, 101) to (483, 234).
; PLAN: r0=366(x1), r1=101(y1), r2=483(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 101
LDI r2, 483
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
