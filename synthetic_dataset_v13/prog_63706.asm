; DESCRIPTION: Renders a green line between points (389, 121) and (52, 233).
; PLAN: r0=389(x1), r1=121(y1), r2=52(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 121
LDI r2, 52
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
