; DESCRIPTION: Renders a green line between points (118, 252) and (115, 31).
; PLAN: r0=118(x1), r1=252(y1), r2=115(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 252
LDI r2, 115
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
