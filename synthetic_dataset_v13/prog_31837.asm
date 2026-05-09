; DESCRIPTION: Renders a white line between points (194, 90) and (500, 85).
; PLAN: r0=194(x1), r1=90(y1), r2=500(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 90
LDI r2, 500
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
