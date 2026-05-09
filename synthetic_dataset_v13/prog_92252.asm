; DESCRIPTION: Renders a green line between points (95, 53) and (463, 216).
; PLAN: r0=95(x1), r1=53(y1), r2=463(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 53
LDI r2, 463
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
