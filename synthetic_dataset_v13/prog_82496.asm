; DESCRIPTION: Renders a red line between points (300, 68) and (361, 89).
; PLAN: r0=300(x1), r1=68(y1), r2=361(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 68
LDI r2, 361
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
