; DESCRIPTION: Renders a white line between points (431, 121) and (227, 77).
; PLAN: r0=431(x1), r1=121(y1), r2=227(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 121
LDI r2, 227
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
