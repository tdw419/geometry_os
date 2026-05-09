; DESCRIPTION: Renders a white line between points (112, 70) and (381, 90).
; PLAN: r0=112(x1), r1=70(y1), r2=381(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 70
LDI r2, 381
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
