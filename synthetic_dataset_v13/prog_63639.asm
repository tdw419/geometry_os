; DESCRIPTION: Renders a yellow line between points (84, 143) and (52, 41).
; PLAN: r0=84(x1), r1=143(y1), r2=52(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 143
LDI r2, 52
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
