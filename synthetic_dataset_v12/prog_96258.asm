; DESCRIPTION: Draws a magenta line from (123, 177) to (468, 145).
; PLAN: r0=123(x1), r1=177(y1), r2=468(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 177
LDI r2, 468
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
