; DESCRIPTION: Draws a yellow line from (289, 120) to (158, 9).
; PLAN: r0=289(x1), r1=120(y1), r2=158(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 120
LDI r2, 158
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
