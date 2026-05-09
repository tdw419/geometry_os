; DESCRIPTION: Draws a red line from (149, 114) to (106, 13).
; PLAN: r0=149(x1), r1=114(y1), r2=106(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 114
LDI r2, 106
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
