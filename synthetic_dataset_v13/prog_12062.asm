; DESCRIPTION: Draws a red line from (130, 86) to (238, 106).
; PLAN: r0=130(x1), r1=86(y1), r2=238(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 86
LDI r2, 238
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
