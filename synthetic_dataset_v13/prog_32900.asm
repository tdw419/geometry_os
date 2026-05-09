; DESCRIPTION: Renders a white line between points (206, 55) and (448, 133).
; PLAN: r0=206(x1), r1=55(y1), r2=448(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 55
LDI r2, 448
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
