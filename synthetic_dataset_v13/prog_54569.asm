; DESCRIPTION: Renders a blue line between points (161, 252) and (166, 89).
; PLAN: r0=161(x1), r1=252(y1), r2=166(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 252
LDI r2, 166
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
