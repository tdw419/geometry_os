; DESCRIPTION: Draws a green line from (399, 112) to (335, 185).
; PLAN: r0=399(x1), r1=112(y1), r2=335(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 112
LDI r2, 335
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
