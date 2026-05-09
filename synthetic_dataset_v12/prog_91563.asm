; DESCRIPTION: Draws a green line from (6, 217) to (466, 31).
; PLAN: r0=6(x1), r1=217(y1), r2=466(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 217
LDI r2, 466
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
