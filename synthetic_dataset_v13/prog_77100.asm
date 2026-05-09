; DESCRIPTION: Draws a blue line from (393, 66) to (94, 18).
; PLAN: r0=393(x1), r1=66(y1), r2=94(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 66
LDI r2, 94
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
