; DESCRIPTION: Renders a green line between points (28, 118) and (347, 9).
; PLAN: r0=28(x1), r1=118(y1), r2=347(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 118
LDI r2, 347
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
