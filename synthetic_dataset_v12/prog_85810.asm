; DESCRIPTION: Renders a green line between points (452, 159) and (95, 75).
; PLAN: r0=452(x1), r1=159(y1), r2=95(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 159
LDI r2, 95
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
