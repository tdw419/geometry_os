; DESCRIPTION: Draws a magenta line from (483, 11) to (234, 218).
; PLAN: r0=483(x1), r1=11(y1), r2=234(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 11
LDI r2, 234
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
