; DESCRIPTION: Renders a green line between points (89, 159) and (100, 95).
; PLAN: r0=89(x1), r1=159(y1), r2=100(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 159
LDI r2, 100
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
