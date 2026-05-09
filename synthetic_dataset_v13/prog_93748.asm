; DESCRIPTION: Draws a blue line from (504, 66) to (251, 145).
; PLAN: r0=504(x1), r1=66(y1), r2=251(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 66
LDI r2, 251
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
