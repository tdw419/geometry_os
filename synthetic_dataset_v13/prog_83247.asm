; DESCRIPTION: Renders a red line between points (142, 195) and (448, 57).
; PLAN: r0=142(x1), r1=195(y1), r2=448(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 195
LDI r2, 448
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
