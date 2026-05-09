; DESCRIPTION: Draws a black line from (247, 94) to (377, 66).
; PLAN: r0=247(x1), r1=94(y1), r2=377(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 94
LDI r2, 377
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
