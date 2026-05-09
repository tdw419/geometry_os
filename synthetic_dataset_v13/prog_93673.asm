; DESCRIPTION: Draws a black line from (364, 89) to (94, 21).
; PLAN: r0=364(x1), r1=89(y1), r2=94(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 89
LDI r2, 94
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
