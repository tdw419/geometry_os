; DESCRIPTION: Renders a green line between points (290, 216) and (347, 194).
; PLAN: r0=290(x1), r1=216(y1), r2=347(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 216
LDI r2, 347
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
