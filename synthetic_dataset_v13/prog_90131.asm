; DESCRIPTION: Renders a yellow line between points (193, 51) and (184, 54).
; PLAN: r0=193(x1), r1=51(y1), r2=184(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 51
LDI r2, 184
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
