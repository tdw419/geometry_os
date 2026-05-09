; DESCRIPTION: Draws a black line from (99, 63) to (451, 51).
; PLAN: r0=99(x1), r1=63(y1), r2=451(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 63
LDI r2, 451
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
