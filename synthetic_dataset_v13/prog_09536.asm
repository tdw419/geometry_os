; DESCRIPTION: Draws a white line from (118, 145) to (399, 44).
; PLAN: r0=118(x1), r1=145(y1), r2=399(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 145
LDI r2, 399
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
