; DESCRIPTION: Renders a black line between points (273, 40) and (158, 156).
; PLAN: r0=273(x1), r1=40(y1), r2=158(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 40
LDI r2, 158
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
