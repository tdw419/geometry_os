; DESCRIPTION: Draws a magenta line from (423, 147) to (473, 242).
; PLAN: r0=423(x1), r1=147(y1), r2=473(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 147
LDI r2, 473
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
