; DESCRIPTION: Renders a red line between points (146, 84) and (390, 48).
; PLAN: r0=146(x1), r1=84(y1), r2=390(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 84
LDI r2, 390
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
