; DESCRIPTION: Renders a white line between points (225, 118) and (112, 141).
; PLAN: r0=225(x1), r1=118(y1), r2=112(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 118
LDI r2, 112
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
