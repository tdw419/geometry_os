; DESCRIPTION: Renders a white line between points (112, 217) and (279, 137).
; PLAN: r0=112(x1), r1=217(y1), r2=279(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 217
LDI r2, 279
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
