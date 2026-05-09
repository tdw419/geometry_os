; DESCRIPTION: Renders a red line between points (156, 187) and (105, 38).
; PLAN: r0=156(x1), r1=187(y1), r2=105(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 187
LDI r2, 105
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
