; DESCRIPTION: Renders a yellow line between points (210, 41) and (315, 200).
; PLAN: r0=210(x1), r1=41(y1), r2=315(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 41
LDI r2, 315
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
