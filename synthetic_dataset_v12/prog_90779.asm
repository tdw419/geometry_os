; DESCRIPTION: Draws a red line from (448, 46) to (189, 197).
; PLAN: r0=448(x1), r1=46(y1), r2=189(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 46
LDI r2, 189
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
