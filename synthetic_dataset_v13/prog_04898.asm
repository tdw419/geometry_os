; DESCRIPTION: Renders a red line between points (296, 112) and (480, 119).
; PLAN: r0=296(x1), r1=112(y1), r2=480(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 112
LDI r2, 480
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
