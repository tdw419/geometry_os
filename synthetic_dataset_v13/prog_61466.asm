; DESCRIPTION: Renders a red line between points (119, 220) and (464, 188).
; PLAN: r0=119(x1), r1=220(y1), r2=464(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 220
LDI r2, 464
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
