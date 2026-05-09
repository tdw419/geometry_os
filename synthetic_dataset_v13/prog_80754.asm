; DESCRIPTION: Draws a blue line from (227, 27) to (145, 58).
; PLAN: r0=227(x1), r1=27(y1), r2=145(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 27
LDI r2, 145
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
