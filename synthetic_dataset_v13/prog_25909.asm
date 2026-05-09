; DESCRIPTION: Draws a purple line from (63, 18) to (38, 89).
; PLAN: r0=63(x1), r1=18(y1), r2=38(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 18
LDI r2, 38
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
