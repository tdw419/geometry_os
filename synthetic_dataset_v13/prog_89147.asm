; DESCRIPTION: Draws a white line from (77, 229) to (216, 87).
; PLAN: r0=77(x1), r1=229(y1), r2=216(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 229
LDI r2, 216
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
