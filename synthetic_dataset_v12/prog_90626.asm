; DESCRIPTION: Renders a white line between points (458, 47) and (377, 251).
; PLAN: r0=458(x1), r1=47(y1), r2=377(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 47
LDI r2, 377
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
