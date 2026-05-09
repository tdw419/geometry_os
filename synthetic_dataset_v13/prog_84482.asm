; DESCRIPTION: Draws a white line from (131, 0) to (266, 145).
; PLAN: r0=131(x1), r1=0(y1), r2=266(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 0
LDI r2, 266
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
