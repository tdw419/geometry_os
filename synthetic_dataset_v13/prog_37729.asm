; DESCRIPTION: Draws a white line from (36, 193) to (110, 145).
; PLAN: r0=36(x1), r1=193(y1), r2=110(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 193
LDI r2, 110
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
