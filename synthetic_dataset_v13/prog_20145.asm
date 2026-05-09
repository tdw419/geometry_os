; DESCRIPTION: Draws a magenta line from (488, 183) to (200, 147).
; PLAN: r0=488(x1), r1=183(y1), r2=200(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 183
LDI r2, 200
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
