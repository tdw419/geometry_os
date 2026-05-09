; DESCRIPTION: Renders a white line between points (180, 47) and (282, 216).
; PLAN: r0=180(x1), r1=47(y1), r2=282(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 47
LDI r2, 282
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
