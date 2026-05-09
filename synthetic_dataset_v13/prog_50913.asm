; DESCRIPTION: Draws a red line from (36, 250) to (90, 149).
; PLAN: r0=36(x1), r1=250(y1), r2=90(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 250
LDI r2, 90
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
