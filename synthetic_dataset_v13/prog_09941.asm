; DESCRIPTION: Draws a black line from (11, 170) to (186, 94).
; PLAN: r0=11(x1), r1=170(y1), r2=186(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 170
LDI r2, 186
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
