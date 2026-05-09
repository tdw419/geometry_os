; DESCRIPTION: Renders a green line between points (100, 10) and (232, 241).
; PLAN: r0=100(x1), r1=10(y1), r2=232(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 10
LDI r2, 232
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
