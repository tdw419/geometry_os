; DESCRIPTION: Draws a magenta line from (449, 174) to (161, 216).
; PLAN: r0=449(x1), r1=174(y1), r2=161(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 174
LDI r2, 161
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
