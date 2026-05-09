; DESCRIPTION: Draws a blue line from (251, 134) to (321, 216).
; PLAN: r0=251(x1), r1=134(y1), r2=321(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 134
LDI r2, 321
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
