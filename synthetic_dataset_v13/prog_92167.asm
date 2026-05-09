; DESCRIPTION: Draws a black line from (36, 229) to (339, 75).
; PLAN: r0=36(x1), r1=229(y1), r2=339(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 229
LDI r2, 339
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
