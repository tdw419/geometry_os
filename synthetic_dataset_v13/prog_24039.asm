; DESCRIPTION: Renders a red line between points (47, 132) and (408, 89).
; PLAN: r0=47(x1), r1=132(y1), r2=408(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 132
LDI r2, 408
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
