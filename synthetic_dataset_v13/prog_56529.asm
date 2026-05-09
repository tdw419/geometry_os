; DESCRIPTION: Draws a black line from (312, 199) to (273, 216).
; PLAN: r0=312(x1), r1=199(y1), r2=273(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 199
LDI r2, 273
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
