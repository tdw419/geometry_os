; DESCRIPTION: Draws a magenta line from (481, 252) to (33, 230).
; PLAN: r0=481(x1), r1=252(y1), r2=33(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 252
LDI r2, 33
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
