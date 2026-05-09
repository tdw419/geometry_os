; DESCRIPTION: Draws a magenta line from (147, 243) to (75, 20).
; PLAN: r0=147(x1), r1=243(y1), r2=75(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 243
LDI r2, 75
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
