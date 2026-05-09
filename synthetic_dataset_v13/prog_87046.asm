; DESCRIPTION: Draws a magenta line from (300, 18) to (147, 243).
; PLAN: r0=300(x1), r1=18(y1), r2=147(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 18
LDI r2, 147
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
