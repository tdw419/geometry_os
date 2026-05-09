; DESCRIPTION: Renders a white line between points (288, 233) and (78, 159).
; PLAN: r0=288(x1), r1=233(y1), r2=78(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 233
LDI r2, 78
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
