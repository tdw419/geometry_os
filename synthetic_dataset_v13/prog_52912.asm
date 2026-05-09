; DESCRIPTION: Draws a red line from (281, 189) to (136, 85).
; PLAN: r0=281(x1), r1=189(y1), r2=136(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 189
LDI r2, 136
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
