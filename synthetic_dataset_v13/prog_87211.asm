; DESCRIPTION: Draws a yellow line from (106, 89) to (143, 96).
; PLAN: r0=106(x1), r1=89(y1), r2=143(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 89
LDI r2, 143
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
