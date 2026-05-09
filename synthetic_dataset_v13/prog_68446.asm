; DESCRIPTION: Draws a red line from (89, 4) to (417, 108).
; PLAN: r0=89(x1), r1=4(y1), r2=417(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 4
LDI r2, 417
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
