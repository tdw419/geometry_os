; DESCRIPTION: Draws a magenta line from (483, 27) to (428, 119).
; PLAN: r0=483(x1), r1=27(y1), r2=428(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 27
LDI r2, 428
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
