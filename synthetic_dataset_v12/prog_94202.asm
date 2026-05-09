; DESCRIPTION: Draws a blue line from (36, 112) to (22, 126).
; PLAN: r0=36(x1), r1=112(y1), r2=22(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 112
LDI r2, 22
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
