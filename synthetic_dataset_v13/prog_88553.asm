; DESCRIPTION: Draws a black line from (244, 89) to (309, 80).
; PLAN: r0=244(x1), r1=89(y1), r2=309(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 89
LDI r2, 309
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
