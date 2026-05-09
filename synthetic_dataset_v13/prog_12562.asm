; DESCRIPTION: Draws a black line from (94, 89) to (82, 160).
; PLAN: r0=94(x1), r1=89(y1), r2=82(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 89
LDI r2, 82
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
