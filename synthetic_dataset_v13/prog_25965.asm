; DESCRIPTION: Draws a magenta line from (455, 243) to (323, 70).
; PLAN: r0=455(x1), r1=243(y1), r2=323(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 243
LDI r2, 323
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
