; DESCRIPTION: Renders a black line between points (368, 47) and (484, 161).
; PLAN: r0=368(x1), r1=47(y1), r2=484(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 47
LDI r2, 484
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
