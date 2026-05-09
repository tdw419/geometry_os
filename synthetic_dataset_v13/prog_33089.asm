; DESCRIPTION: Renders a white line between points (306, 218) and (389, 180).
; PLAN: r0=306(x1), r1=218(y1), r2=389(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 218
LDI r2, 389
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
