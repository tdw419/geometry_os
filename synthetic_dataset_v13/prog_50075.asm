; DESCRIPTION: Renders a red line between points (210, 196) and (89, 119).
; PLAN: r0=210(x1), r1=196(y1), r2=89(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 196
LDI r2, 89
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
