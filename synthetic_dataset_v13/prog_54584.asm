; DESCRIPTION: Draws a red line from (26, 250) to (24, 66).
; PLAN: r0=26(x1), r1=250(y1), r2=24(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 250
LDI r2, 24
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
