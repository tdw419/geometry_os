; DESCRIPTION: Renders a green line between points (389, 41) and (73, 8).
; PLAN: r0=389(x1), r1=41(y1), r2=73(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 41
LDI r2, 73
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
