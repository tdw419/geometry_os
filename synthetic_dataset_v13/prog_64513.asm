; DESCRIPTION: Draws a magenta line from (470, 119) to (238, 89).
; PLAN: r0=470(x1), r1=119(y1), r2=238(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 119
LDI r2, 238
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
