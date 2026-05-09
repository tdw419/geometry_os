; DESCRIPTION: Renders a white line between points (359, 47) and (462, 133).
; PLAN: r0=359(x1), r1=47(y1), r2=462(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 47
LDI r2, 462
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
