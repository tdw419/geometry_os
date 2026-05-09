; DESCRIPTION: Renders a white line between points (400, 118) and (100, 157).
; PLAN: r0=400(x1), r1=118(y1), r2=100(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 118
LDI r2, 100
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
