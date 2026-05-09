; DESCRIPTION: Draws a blue line from (427, 209) to (357, 13).
; PLAN: r0=427(x1), r1=209(y1), r2=357(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 209
LDI r2, 357
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
