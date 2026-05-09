; DESCRIPTION: Draws a magenta line from (169, 51) to (504, 218).
; PLAN: r0=169(x1), r1=51(y1), r2=504(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 51
LDI r2, 504
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
