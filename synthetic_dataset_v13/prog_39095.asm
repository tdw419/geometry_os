; DESCRIPTION: Renders a black line between points (201, 8) and (446, 41).
; PLAN: r0=201(x1), r1=8(y1), r2=446(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 8
LDI r2, 446
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
