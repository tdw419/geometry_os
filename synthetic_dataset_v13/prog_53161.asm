; DESCRIPTION: Draws a green line from (289, 252) to (118, 77).
; PLAN: r0=289(x1), r1=252(y1), r2=118(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 252
LDI r2, 118
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
