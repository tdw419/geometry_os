; DESCRIPTION: Renders a red line between points (464, 89) and (155, 103).
; PLAN: r0=464(x1), r1=89(y1), r2=155(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 89
LDI r2, 155
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
