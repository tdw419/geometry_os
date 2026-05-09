; DESCRIPTION: Renders a white line between points (47, 110) and (444, 159).
; PLAN: r0=47(x1), r1=110(y1), r2=444(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 110
LDI r2, 444
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
