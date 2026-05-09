; DESCRIPTION: Draws a red line from (111, 89) to (186, 110).
; PLAN: r0=111(x1), r1=89(y1), r2=186(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 89
LDI r2, 186
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
